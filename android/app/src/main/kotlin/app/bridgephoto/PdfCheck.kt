package app.bridgephoto

import com.tom_roush.pdfbox.contentstream.PDFGraphicsStreamEngine
import com.tom_roush.pdfbox.pdmodel.PDDocument
import com.tom_roush.pdfbox.pdmodel.PDPage
import com.tom_roush.pdfbox.pdmodel.font.PDFont
import com.tom_roush.pdfbox.text.PDFTextStripper
import com.tom_roush.pdfbox.text.TextPosition
import android.graphics.Path
import android.graphics.PointF
import java.io.File
import kotlin.math.max
import kotlin.math.min

/**
 * Looking at a PDF somebody else sent, and saying what is odd about it.
 *
 * Everything here reads the file's own structure. None of it looks at the
 * pixels, and that is deliberate: the picture-forensics approach — error level
 * analysis, JPEG ghosts — was tried and does not work. A forged invoice made
 * the ordinary way, by opening the file and retyping the total, scores
 * identically to the genuine one, because saving re-encodes the whole page on
 * the same grid. Anything built on that would hand people false confidence
 * about a contract, which is worse than having nothing.
 *
 * The structure, by contrast, keeps honest records.
 *
 * **Nothing here is a verdict.** Every one of these has an innocent
 * explanation, and a consumer app calling somebody's document forged is a
 * liability rather than a feature. They are things to go and look at.
 */
object PdfCheck {

    /** Darker than this, on 0..1, counts as a blackout box. */
    const val DARK_FILL = 0.25f

    /** A box smaller than this many square points is not hiding anything. */
    const val MIN_BOX_AREA = 200.0

    /** This much of a word must be inside the box before it counts as hidden. */
    const val COVERED_SHARE = 0.6

    class Finding(val kind: String, val page: Int, val detail: String)

    fun inspect(path: String): Map<String, Any> {
        val file = File(path)
        require(file.exists()) { "That file is not there." }
        val findings = ArrayList<Finding>()
        val raw = file.readBytes()

        // Revisions. A PDF can be saved on top of itself, and every earlier
        // version is still in the file. Perfectly normal for a signed form;
        // worth a look on a bank statement.
        val revisions = countMarker(raw, "%%EOF".toByteArray())
        if (revisions > 1) {
            findings.add(
                Finding(
                    "revisions", 0,
                    "This file was saved $revisions times, one on top of another. " +
                        "Earlier versions are still inside it."
                )
            )
        }

        PDDocument.load(file).use { doc ->
            val info = doc.documentInformation
            val producer = info?.producer?.trim().orEmpty()
            val creator = info?.creator?.trim().orEmpty()
            if (producer.isNotEmpty() || creator.isNotEmpty()) {
                findings.add(
                    Finding("madeBy", 0, listOf(creator, producer)
                        .filter { it.isNotEmpty() }.joinToString(", then "))
                )
            }

            for (i in 0 until doc.numberOfPages) {
                val page = doc.getPage(i)
                fontMix(page)?.let { findings.add(Finding("fontMix", i + 1, it)) }
                val hidden = textUnderBoxes(doc, page, i)
                if (hidden.isNotEmpty()) {
                    findings.add(
                        Finding(
                            "readableUnderBox", i + 1,
                            hidden.joinToString(" ").take(300)
                        )
                    )
                }
            }
        }
        return mapOf(
            "findings" to findings.map {
                mapOf("kind" to it.kind, "page" to it.page, "detail" to it.detail)
            }
        )
    }

    private fun countMarker(data: ByteArray, marker: ByteArray): Int {
        var n = 0
        var i = 0
        outer@ while (i <= data.size - marker.size) {
            for (j in marker.indices) {
                if (data[i + j] != marker[j]) { i++; continue@outer }
            }
            n++
            i += marker.size
        }
        return n
    }

    /**
     * Fonts that are partly carried inside the file and partly left to the
     * reader to find.
     *
     * A document made in one go embeds its fonts or does not. A page where
     * some text carries its font and some does not is the fingerprint of text
     * added later with a different tool — which is exactly how a figure on a
     * statement gets changed. It is also what happens when somebody fills in a
     * form perfectly legitimately, which is why this is a thing to look at and
     * not an accusation.
     */
    fun fontMix(page: PDPage): String? {
        val res = page.resources ?: return null
        var embedded = 0
        var loose = 0
        val looseNames = ArrayList<String>()
        for (name in res.fontNames) {
            val font: PDFont = try {
                res.getFont(name) ?: continue
            } catch (_: Throwable) {
                continue
            }
            if (font.isEmbedded) embedded++ else {
                loose++
                if (looseNames.size < 4) looseNames.add(font.name ?: name.name)
            }
        }
        if (embedded == 0 || loose == 0) return null
        return "$embedded of the fonts on this page travel with the file and " +
            "$loose do not (${looseNames.joinToString(", ")}). Text added later " +
            "with another tool looks like this."
    }

    /**
     * Words still sitting under a blacked-out box.
     *
     * The most famous way to leak a document there is: draw a black rectangle
     * over a name and save. The rectangle is a picture; the name is still text
     * underneath it, and anyone can select it. Courts and government
     * departments have published documents this way more than once.
     */
    fun textUnderBoxes(doc: PDDocument, page: PDPage, index: Int): List<String> {
        val boxes = darkBoxes(page)
        if (boxes.isEmpty()) return emptyList()
        val words = ArrayList<Pair<String, DoubleArray>>()
        val stripper = object : PDFTextStripper() {
            override fun writeString(text: String, positions: MutableList<TextPosition>) {
                if (positions.isEmpty()) return
                var l = Double.MAX_VALUE
                var r = -Double.MAX_VALUE
                var t = Double.MAX_VALUE
                var b = -Double.MAX_VALUE
                for (p in positions) {
                    val x = p.xDirAdj.toDouble()
                    val y = p.yDirAdj.toDouble()
                    l = min(l, x); r = max(r, x + p.widthDirAdj)
                    t = min(t, y - p.heightDir); b = max(b, y)
                }
                // the stripper counts down the page, the page itself counts up
                val h = page.mediaBox.height.toDouble()
                words.add(text to doubleArrayOf(l, h - b, r, h - t))
            }
        }
        stripper.startPage = index + 1
        stripper.endPage = index + 1
        stripper.getText(doc)
        val hidden = ArrayList<String>()
        for ((text, w) in words) {
            val trimmed = text.trim()
            if (trimmed.isEmpty()) continue
            for (box in boxes) {
                if (coveredShare(w, box) >= COVERED_SHARE) { hidden.add(trimmed); break }
            }
        }
        return hidden
    }

    /** How much of [word] lies inside [box], as a share of the word. */
    fun coveredShare(word: DoubleArray, box: DoubleArray): Double {
        val w = min(word[2], box[2]) - max(word[0], box[0])
        val h = min(word[3], box[3]) - max(word[1], box[1])
        if (w <= 0 || h <= 0) return 0.0
        val area = (word[2] - word[0]) * (word[3] - word[1])
        if (area <= 0) return 0.0
        return (w * h) / area
    }

    /** Every dark filled rectangle drawn on the page. */
    private fun darkBoxes(page: PDPage): List<DoubleArray> {
        val out = ArrayList<DoubleArray>()
        val engine = object : PDFGraphicsStreamEngine(page) {
            private val pts = ArrayList<PointF>()
            private var cur: PointF? = null

            override fun appendRectangle(
                p0: PointF, p1: PointF, p2: PointF, p3: PointF
            ) { pts.addAll(listOf(p0, p1, p2, p3)) }

            override fun drawImage(image: com.tom_roush.pdfbox.pdmodel.graphics.image.PDImage) {}
            override fun clip(windingRule: Path.FillType) {}
            override fun moveTo(x: Float, y: Float) {
                cur = PointF(x, y); pts.add(cur!!)
            }
            override fun lineTo(x: Float, y: Float) {
                cur = PointF(x, y); pts.add(cur!!)
            }
            override fun curveTo(x1: Float, y1: Float, x2: Float, y2: Float, x3: Float, y3: Float) {
                cur = PointF(x3, y3); pts.add(cur!!)
            }
            override fun getCurrentPoint(): PointF = cur ?: PointF(0f, 0f)
            override fun closePath() {}
            override fun endPath() { pts.clear() }
            override fun strokePath() { pts.clear() }
            override fun fillPath(windingRule: Path.FillType) { take(); pts.clear() }
            override fun fillAndStrokePath(windingRule: Path.FillType) { take(); pts.clear() }
            override fun shadingFill(shadingName: com.tom_roush.pdfbox.cos.COSName) {}

            private fun take() {
                if (pts.size < 3) return
                val dark = try {
                    val c = graphicsState.nonStrokingColor.toRGB()
                    val r = (c shr 16 and 0xFF) / 255f
                    val g = (c shr 8 and 0xFF) / 255f
                    val b = (c and 0xFF) / 255f
                    (r * 0.3f + g * 0.6f + b * 0.1f) < DARK_FILL
                } catch (_: Throwable) {
                    false
                }
                if (!dark) return
                var l = Double.MAX_VALUE; var r = -Double.MAX_VALUE
                var t = Double.MAX_VALUE; var b = -Double.MAX_VALUE
                for (p in pts) {
                    l = min(l, p.x.toDouble()); r = max(r, p.x.toDouble())
                    t = min(t, p.y.toDouble()); b = max(b, p.y.toDouble())
                }
                if ((r - l) * (b - t) >= MIN_BOX_AREA) out.add(doubleArrayOf(l, t, r, b))
            }
        }
        return try {
            engine.processPage(page)
            out
        } catch (_: Throwable) {
            emptyList()
        }
    }
}
