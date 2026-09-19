package app.bridgephoto

import android.app.Activity
import android.content.ContentValues
import android.content.Intent
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Color
import android.graphics.Matrix
import android.graphics.pdf.PdfRenderer
import android.os.Build
import android.os.Environment
import android.os.Handler
import android.os.Looper
import android.os.ParcelFileDescriptor
import android.provider.ContactsContract.Intents.Insert
import android.provider.MediaStore
import com.google.android.gms.tasks.Tasks
import com.google.mlkit.vision.common.InputImage
import com.google.mlkit.vision.documentscanner.GmsDocumentScannerOptions
import com.google.mlkit.vision.documentscanner.GmsDocumentScanning
import com.google.mlkit.vision.documentscanner.GmsDocumentScanningResult
import com.google.mlkit.vision.text.TextRecognition
import com.google.mlkit.vision.text.TextRecognizer
import com.google.mlkit.vision.text.chinese.ChineseTextRecognizerOptions
import com.google.mlkit.vision.text.devanagari.DevanagariTextRecognizerOptions
import com.google.mlkit.vision.text.japanese.JapaneseTextRecognizerOptions
import com.google.mlkit.vision.text.korean.KoreanTextRecognizerOptions
import com.google.mlkit.vision.text.latin.TextRecognizerOptions
import com.googlecode.leptonica.android.AdaptiveMap
import com.googlecode.leptonica.android.Binarize
import com.googlecode.leptonica.android.Convert
import com.googlecode.leptonica.android.Enhance
import com.googlecode.leptonica.android.Pix
import com.googlecode.leptonica.android.ReadFile
import com.googlecode.leptonica.android.Skew
import com.googlecode.leptonica.android.WriteFile
import com.googlecode.tesseract.android.TessBaseAPI
import com.tom_roush.pdfbox.android.PDFBoxResourceLoader
import com.tom_roush.pdfbox.io.MemoryUsageSetting
import com.tom_roush.pdfbox.multipdf.PDFMergerUtility
import com.tom_roush.pdfbox.pdmodel.PDDocument
import com.tom_roush.pdfbox.pdmodel.encryption.AccessPermission
import com.tom_roush.pdfbox.pdmodel.encryption.StandardProtectionPolicy
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.io.FileOutputStream
import kotlin.math.max
import kotlin.math.min

/**
 * The native engine behind the "bridgephoto/engine" channel.
 *  - scan:          Google ML Kit document scanner (Play services, on device)
 *  - ocr:           Google ML Kit text recognition (Latin / Devanagari / CJK)
 *                   plus Tesseract for Arabic, which ML Kit cannot read.
 *                   Everything runs on the device.
 *  - mergePdf:      PDFBox-Android, lossless
 *  - renderPdf:     android.graphics.pdf.PdfRenderer -> JPEG pages
 *  - transform:     rotate / re-encode an image
 *  - saveToGallery: MediaStore (Android 10+ only, no permission needed)
 */
class Engine(private val activity: Activity) : MethodChannel.MethodCallHandler {
    private val main = Handler(Looper.getMainLooper())
    /** Set by MainActivity so the engine can push events (recovered scans) to Dart. */
    var channel: MethodChannel? = null

    companion object {
        const val REQ_SCAN = 7101
        /** A contact photo travels inside the intent, which crosses a 1 MB Binder call. */
        const val PHOTO_LIMIT = 400_000
        /** The Tesseract language pack shipped in assets/tessdata. */
        const val TESS_LANG = "ara"
        /** Below this, Tesseract is guessing; a wrong word is worse than none. */
        const val TESS_MIN_CONFIDENCE = 45f
        /** Straightening by less than this is invisible and costs a resample. */
        const val SKEW_MIN_DEGREES = 0.25f
        /** Beyond this it is not a crooked page, it is a bad reading. */
        const val SKEW_MAX_DEGREES = 15f
        /** One sheet = A4 at 300 dpi, which is what a printer expects. */
        const val SHEET_W = 2480
        const val SHEET_H = 3508
        const val SHEET_MARGIN = 0.05f
        const val SHEET_GAP = 0.04f
        /** The fold is looked for in the middle 40% and nowhere else. */
        const val GUTTER_SEARCH = 0.40f
        /**
         * A fold must be darker than the columns to EACH side of it by this
         * much. Comparing against the whole-page average does not work: a
         * block of text is broad and dim, so a page with no fold at all gets
         * cut in the wrong place. A fold is narrow and dark.
         */
        const val GUTTER_MIN_DROP = 8f
        /** How far to each side the shoulders are measured, as a fraction. */
        const val GUTTER_SHOULDER = 0.06f
        const val GUTTER_SAMPLE_W = 800
        const val GUTTER_SAMPLE_H = 200
        val NL: String = System.lineSeparator()
    }

    init {
        PDFBoxResourceLoader.init(activity.applicationContext)
    }

    private val pendingDir: File get() = File(activity.cacheDir, "scan_pending")

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        try {
            dispatch(call, result)
        } catch (e: Throwable) {
            CrashLog.append(activity, "method " + call.method + " threw: " + e + NL + e.stackTraceToString())
            try {
                result.error("engine", call.method + ": " + e, null)
            } catch (_: IllegalStateException) {
            }
        }
    }

    private fun dispatch(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "scan" -> scan(call, result)
            "warmUp" -> result.success(warmUp())
            "takePendingScan" -> bg(result) { takePendingScan() }
            "takeCrashLog" -> result.success(CrashLog.take(activity))
            "logError" -> {
                CrashLog.append(activity, call.argument<String>("text") ?: "")
                result.success(true)
            }
            "ocr" -> bg(result) {
                ocr(
                    call.argument<String>("path")!!,
                    call.argument<String>("script") ?: "latin",
                    call.argument<Int>("maxDim") ?: 4096
                )
            }
            "compressImage" -> bg(result) {
                compressImage(
                    call.argument<String>("input")!!,
                    call.argument<String>("output")!!,
                    call.argument<Int>("maxDim") ?: 2400,
                    call.argument<Int>("quality") ?: 80
                )
            }
            "encryptPdf" -> bg(result) {
                encryptPdf(
                    call.argument<String>("input")!!,
                    call.argument<String>("output")!!,
                    call.argument<String>("password") ?: ""
                )
                true
            }
            "redact" -> bg(result) {
                redact(
                    call.argument<String>("page")!!,
                    call.argument<List<Map<String, Any>>>("rects") ?: emptyList(),
                    call.argument<Int>("quality") ?: 92
                )
                true
            }
            "splitSpread" -> bg(result) {
                splitSpread(
                    call.argument<String>("input")!!,
                    call.argument<String>("outLeft")!!,
                    call.argument<String>("outRight")!!,
                    call.argument<Int>("quality") ?: 92
                )
            }
            "composeSheet" -> bg(result) {
                composeSheet(
                    call.argument<List<String>>("inputs")!!,
                    call.argument<String>("output")!!,
                    call.argument<Int>("quality") ?: 92
                )
                true
            }
            "enhance" -> bg(result) {
                enhance(
                    call.argument<String>("input")!!,
                    call.argument<String>("output")!!,
                    call.argument<String>("mode") ?: "auto",
                    call.argument<Boolean>("straighten") ?: false,
                    call.argument<Int>("quality") ?: 92
                )
            }
            "mergePdf" -> bg(result) {
                mergePdf(call.argument<List<String>>("inputs")!!, call.argument<String>("output")!!)
                true
            }
            "renderPdf" -> bg(result) {
                renderPdf(
                    call.argument<String>("input")!!,
                    call.argument<String>("outDir")!!,
                    call.argument<Int>("maxDim") ?: 2200
                )
            }
            "transform" -> bg(result) {
                transform(
                    call.argument<String>("input")!!,
                    call.argument<String>("output")!!,
                    call.argument<Int>("rotate") ?: 0,
                    call.argument<String>("format") ?: "jpg",
                    call.argument<Int>("quality") ?: 92
                )
                true
            }
            "overlay" -> bg(result) {
                overlay(
                    call.argument<String>("page")!!,
                    call.argument<String>("sticker")!!,
                    call.argument<Int>("x") ?: 0,
                    call.argument<Int>("y") ?: 0,
                    call.argument<Int>("w") ?: 0,
                    call.argument<Int>("h") ?: 0
                )
                true
            }
            "addContact" -> bg(result) {
                val fields = HashMap<String, String>()
                for (k in listOf("name", "company", "jobTitle", "mobile", "phone", "fax", "email", "website", "address", "city", "country", "notes", "photo")) {
                    call.argument<String>(k)?.let { fields[k] = it }
                }
                val intent = buildContactIntent(fields)
                main.post { activity.startActivity(intent) }
                true
            }
            "saveToGallery" -> bg(result) {
                saveToGallery(
                    call.argument<String>("path")!!,
                    call.argument<String>("mime")!!,
                    call.argument<String>("name")!!
                )
            }
            else -> result.notImplemented()
        }
    }

    /** A reply that can only happen once; a second attempt is logged, never fatal. */
    private inner class SafeResult(private val r: MethodChannel.Result) {
        private var done = false
        fun success(v: Any?) = reply { r.success(v) }
        fun error(code: String, msg: String) = reply { r.error(code, msg, null) }
        private fun reply(block: () -> Unit) {
            if (done) return
            done = true
            try {
                block()
            } catch (e: IllegalStateException) {
                CrashLog.append(activity, "double reply: " + e + "\n" + Throwable().stackTraceToString())
            }
        }
    }

    private fun bg(result: MethodChannel.Result, work: () -> Any?) {
        val safe = SafeResult(result)
        Thread {
            try {
                val v = work()
                main.post { safe.success(v) }
            } catch (e: Throwable) {
                // Tasks.await wraps the real failure in an ExecutionException.
                val c = (e as? java.util.concurrent.ExecutionException)?.cause ?: e
                main.post { safe.error("engine", c.message ?: c.toString()) }
            }
        }.start()
    }

    /** Pages of a scan that finished while no Dart call was waiting (the activity
     *  was recreated behind the scanner). Moved out of the pending folder. */
    private fun takePendingScan(): List<String> {
        val dir = pendingDir
        val files = dir.listFiles()?.filter { it.isFile && it.name.endsWith(".jpg") }?.sortedBy { it.name }
            ?: return emptyList()
        val outDir = File(activity.cacheDir, "scan").apply { mkdirs() }
        return files.map { f ->
            val dst = File(outDir, f.name)
            if (!f.renameTo(dst)) { f.copyTo(dst, overwrite = true); f.delete() }
            dst.absolutePath
        }
    }

    // ---------------------------------------------------------------- scan
    //
    // One ScanSession per Scan tap. Every way a session can end (pages, cancel,
    // error, timeout, replaced by a newer tap) goes through finish(), which
    // replies exactly once. Flutter throws "Reply already submitted" on a
    // second reply, and that would kill the app.

    private inner class ScanSession(val result: MethodChannel.Result) {
        var launched = false
        var done = false
        val timeout = Runnable {
            if (!done && !launched) {
                finish(this, "timeout") {
                    it.error(
                        "scanner",
                        "Google Play services is still downloading the scanner (this happens once). " +
                            "Please try again in a minute.",
                        null
                    )
                }
            }
        }
    }

    private var session: ScanSession? = null

    /** Ends [s] once. Must run on the main thread. */
    private fun finish(s: ScanSession, why: String, reply: (MethodChannel.Result) -> Unit) {
        if (s.done) return
        s.done = true
        main.removeCallbacks(s.timeout)
        if (session === s) session = null
        channel?.invokeMethod("scanState", "closed")
        try {
            reply(s.result)
        } catch (e: IllegalStateException) {
            // Already answered: never fatal, but record how it happened.
            CrashLog.append(activity, "scan double reply ($why): " + e + "\n" + Throwable().stackTraceToString())
        }
    }

    /** Ask Google Play services to install the scanner module now, so the first
     *  Scan does not have to wait for a download. Fire and forget. */
    private fun warmUp(): Boolean {
        return try {
            val client = GmsDocumentScanning.getClient(
                GmsDocumentScannerOptions.Builder()
                    .setResultFormats(GmsDocumentScannerOptions.RESULT_FORMAT_JPEG)
                    .setScannerMode(GmsDocumentScannerOptions.SCANNER_MODE_FULL)
                    .build()
            )
            val request = com.google.android.gms.common.moduleinstall.ModuleInstallRequest.newBuilder()
                .addApi(client)
                .build()
            com.google.android.gms.common.moduleinstall.ModuleInstall.getClient(activity)
                .installModules(request)
            true
        } catch (e: Throwable) {
            false
        }
    }

    private fun scan(call: MethodCall, result: MethodChannel.Result) {
        val cur = session
        if (cur != null) {
            if (cur.launched) {
                // The previous scanner never reported back (it cannot still be
                // open: the user is tapping our button). Drop it and go on.
                finish(cur, "replaced") { it.success(emptyList<String>()) }
            } else {
                result.error("busy", "The scanner is still being prepared. Please wait a moment.", null)
                return
            }
        }
        val mode = when (call.argument<String>("mode")) {
            "base" -> GmsDocumentScannerOptions.SCANNER_MODE_BASE
            "filter" -> GmsDocumentScannerOptions.SCANNER_MODE_BASE_WITH_FILTER
            else -> GmsDocumentScannerOptions.SCANNER_MODE_FULL
        }
        val options = GmsDocumentScannerOptions.Builder()
            .setGalleryImportAllowed(call.argument<Boolean>("gallery") ?: true)
            .setPageLimit(max(1, call.argument<Int>("pageLimit") ?: 50))
            .setResultFormats(GmsDocumentScannerOptions.RESULT_FORMAT_JPEG)
            .setScannerMode(mode)
            .build()

        val s = ScanSession(result)
        session = s
        channel?.invokeMethod("scanState", "preparing")
        // First use: Play services downloads the scanner module and the intent
        // task only completes afterwards. Do not wait forever.
        main.postDelayed(s.timeout, 90_000)

        val task = try {
            GmsDocumentScanning.getClient(options).getStartScanIntent(activity)
        } catch (e: Throwable) {
            CrashLog.append(activity, "getStartScanIntent threw: " + e + NL + e.stackTraceToString())
            finish(s, "threw") { it.error("scanner", "Could not start the scanner: " + e, null) }
            return
        }
        task
            .addOnSuccessListener { sender ->
                if (s.done || session !== s) return@addOnSuccessListener
                main.removeCallbacks(s.timeout)
                try {
                    activity.startIntentSenderForResult(sender, REQ_SCAN, null, 0, 0, 0)
                    s.launched = true
                    channel?.invokeMethod("scanState", "open")
                } catch (e: Exception) {
                    finish(s, "launch failed") {
                        it.error("scanner", e.message ?: "Could not open the scanner.", null)
                    }
                }
            }
            .addOnFailureListener { e ->
                if (s.done || session !== s) return@addOnFailureListener
                finish(s, "task failed") {
                    it.error(
                        "scanner",
                        "Could not open the scanner. If this is the first use, Google Play services " +
                            "may still be downloading it: wait a minute and try again. (" +
                            (e.message ?: e.toString()) + ")",
                        null
                    )
                }
            }
    }

    /** Called by MainActivity. Returns true when the result was ours. */
    fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (requestCode != REQ_SCAN) return false
        val s = session
        if (resultCode != Activity.RESULT_OK || data == null) {
            if (s != null) finish(s, "cancelled") { it.success(emptyList<String>()) }
            else channel?.invokeMethod("scanState", "closed")
            return true
        }
        val scan = GmsDocumentScanningResult.fromActivityResultIntent(data)
        val uris = scan?.pages?.map { it.imageUri } ?: emptyList()
        if (s != null) {
            Thread {
                try {
                    val paths = copyPages(uris, File(activity.cacheDir, "scan"))
                    main.post { finish(s, "pages") { it.success(paths) } }
                } catch (e: Throwable) {
                    main.post { finish(s, "copy failed") { it.error("engine", e.message ?: e.toString(), null) } }
                }
            }.start()
        } else {
            // The activity was recreated while the scanner was open: nobody is
            // waiting. Park the pages and tell Dart when it is listening.
            channel?.invokeMethod("scanState", "closed")
            Thread {
                val paths = try { copyPages(uris, pendingDir) } catch (e: Throwable) { emptyList() }
                if (paths.isNotEmpty()) main.post { channel?.invokeMethod("pendingScan", paths) }
            }.start()
        }
        return true
    }

    private fun copyPages(uris: List<android.net.Uri>, outDir: File): List<String> {
        outDir.mkdirs()
        val stamp = System.currentTimeMillis()
        return uris.mapIndexed { i, uri ->
            val f = File(outDir, "scan_${stamp}_${i.toString().padStart(3, '0')}.jpg")
            activity.contentResolver.openInputStream(uri)!!.use { input ->
                FileOutputStream(f).use { input.copyTo(it) }
            }
            f.absolutePath
        }
    }

    // ----------------------------------------------------------------- ocr

    private fun ocr(path: String, script: String, maxDim: Int): Map<String, Any> {
        val bounds = BitmapFactory.Options().apply { inJustDecodeBounds = true }
        BitmapFactory.decodeFile(path, bounds)
        val ow = bounds.outWidth
        val oh = bounds.outHeight
        if (ow <= 0 || oh <= 0) throw IllegalArgumentException("Cannot read the image.")
        // Only shrink when the image is larger than the caller allows: full
        // resolution reads small print better, a 2400 px copy is faster.
        var sample = 1
        while (max(ow, oh) / sample > max(1200, maxDim)) sample *= 2
        val bmp = BitmapFactory.decodeFile(path, BitmapFactory.Options().apply { inSampleSize = sample })
            ?: throw IllegalArgumentException("Cannot decode the image.")
        val sx = ow.toDouble() / bmp.width
        val sy = oh.toDouble() / bmp.height
        try {
            // Arabic is the one script Google does not have a model for, so it
            // is read by Tesseract. ML Kit still reads the Latin half of the
            // page, which is better than Tesseract at it and costs nothing
            // extra: UAE paperwork is nearly always bilingual.
            val lines = if (script == "arabic") {
                val latin = TextRecognition.getClient(TextRecognizerOptions.DEFAULT_OPTIONS)
                merge(mlkit(latin, bmp, sx, sy), tesseractArabic(bmp, sx, sy))
            } else {
                // Every non-Latin recogniser also reads Latin text.
                val recognizer: TextRecognizer = when (script) {
                    "devanagari" -> TextRecognition.getClient(DevanagariTextRecognizerOptions.Builder().build())
                    "chinese" -> TextRecognition.getClient(ChineseTextRecognizerOptions.Builder().build())
                    "japanese" -> TextRecognition.getClient(JapaneseTextRecognizerOptions.Builder().build())
                    "korean" -> TextRecognition.getClient(KoreanTextRecognizerOptions.Builder().build())
                    else -> TextRecognition.getClient(TextRecognizerOptions.DEFAULT_OPTIONS)
                }
                mlkit(recognizer, bmp, sx, sy)
            }
            return mapOf("w" to ow, "h" to oh, "lines" to lines)
        } finally {
            bmp.recycle()
        }
    }

    /** One ML Kit pass, boxes scaled back to the original image's pixels. */
    private fun mlkit(
        recognizer: TextRecognizer,
        bmp: Bitmap,
        sx: Double,
        sy: Double
    ): MutableList<Map<String, Any>> {
        try {
            val text = Tasks.await(recognizer.process(InputImage.fromBitmap(bmp, 0)))
            val lines = ArrayList<Map<String, Any>>()
            for (block in text.textBlocks) {
                for (line in block.lines) {
                    val bb = line.boundingBox ?: continue
                    lines.add(
                        mapOf(
                            "text" to line.text,
                            "l" to (bb.left * sx).toInt(),
                            "t" to (bb.top * sy).toInt(),
                            "r" to (bb.right * sx).toInt(),
                            "b" to (bb.bottom * sy).toInt()
                        )
                    )
                }
            }
            return lines
        } finally {
            recognizer.close()
        }
    }

    // --------------------------------------------------------- arabic (tesseract)

    /**
     * Copies the Arabic language data out of the APK the first time it is
     * needed and returns the folder Tesseract expects (the PARENT of tessdata).
     */
    private fun tessDir(): File {
        val dir = File(activity.filesDir, "tess")
        val data = File(dir, "tessdata")
        if (!data.exists()) data.mkdirs()
        val out = File(data, "$TESS_LANG.traineddata")
        if (!out.exists() || out.length() == 0L) {
            val tmp = File(data, "$TESS_LANG.part")
            activity.assets.open("tessdata/$TESS_LANG.traineddata").use { ins ->
                FileOutputStream(tmp).use { o -> ins.copyTo(o) }
            }
            // Rename last: a half-written file must never look like a good one.
            if (!tmp.renameTo(out)) {
                tmp.delete()
                throw IllegalStateException("Could not unpack the Arabic language data.")
            }
        }
        return dir
    }

    /** Text lines Tesseract found, boxes scaled back to the original pixels. */
    private fun tesseractArabic(bmp: Bitmap, sx: Double, sy: Double): List<Map<String, Any>> {
        val api = TessBaseAPI()
        if (!api.init(tessDir().absolutePath, TESS_LANG)) {
            api.recycle()
            throw IllegalStateException("Arabic text recognition could not start.")
        }
        val out = ArrayList<Map<String, Any>>()
        try {
            api.pageSegMode = TessBaseAPI.PageSegMode.PSM_AUTO
            api.setImage(bmp)
            api.getUTF8Text() // runs the recognition the iterator then walks
            val level = TessBaseAPI.PageIteratorLevel.RIL_TEXTLINE
            val it = api.resultIterator ?: return out
            try {
                it.begin()
                do {
                    val t = it.getUTF8Text(level)?.trim() ?: continue
                    // Keep only what ML Kit cannot read. A Latin line found
                    // here would be a worse reading of one we already have.
                    if (t.isEmpty() || !hasArabic(t)) continue
                    if (it.confidence(level) < TESS_MIN_CONFIDENCE) continue
                    val r = it.getBoundingRect(level) ?: continue
                    out.add(
                        mapOf(
                            "text" to t,
                            "l" to (r.left * sx).toInt(),
                            "t" to (r.top * sy).toInt(),
                            "r" to (r.right * sx).toInt(),
                            "b" to (r.bottom * sy).toInt()
                        )
                    )
                } while (it.next(level))
            } finally {
                it.delete()
            }
        } finally {
            api.recycle()
        }
        return out
    }

    /**
     * Puts the two readings together: every ML Kit line, plus each Arabic line
     * that does not sit on top of one (the same words read twice help nobody).
     * Sorted down the page so the text and the PDF layer read in order.
     */
    private fun merge(
        latin: MutableList<Map<String, Any>>,
        arabic: List<Map<String, Any>>
    ): List<Map<String, Any>> {
        for (a in arabic) {
            if (latin.none { overlap(it, a) > 0.5 }) latin.add(a)
        }
        latin.sortWith(compareBy({ it["t"] as Int }, { it["l"] as Int }))
        return latin
    }

    /** How much of [b]'s box lies inside [a]'s, 0..1. */
    private fun overlap(a: Map<String, Any>, b: Map<String, Any>): Double {
        val w = min(a["r"] as Int, b["r"] as Int) - max(a["l"] as Int, b["l"] as Int)
        val h = min(a["b"] as Int, b["b"] as Int) - max(a["t"] as Int, b["t"] as Int)
        if (w <= 0 || h <= 0) return 0.0
        val area = ((b["r"] as Int) - (b["l"] as Int)).toLong() *
            ((b["b"] as Int) - (b["t"] as Int)).toLong()
        if (area <= 0) return 0.0
        return w.toLong() * h.toLong() / area.toDouble()
    }

    private fun hasArabic(s: String): Boolean = s.any { c ->
        val v = c.code
        // Arabic, Arabic Supplement, Extended-A and the presentation forms.
        (v in 0x0600..0x06FF) || (v in 0x0750..0x077F) ||
            (v in 0x08A0..0x08FF) || (v in 0xFB50..0xFDFF) || (v in 0xFE70..0xFEFF)
    }

    // ----------------------------------------------------------------- pdf

    private fun mergePdf(inputs: List<String>, output: String) {
        val merger = PDFMergerUtility()
        for (p in inputs) merger.addSource(File(p))
        merger.destinationFileName = output
        merger.mergeDocuments(MemoryUsageSetting.setupTempFileOnly())
    }

    private fun renderPdf(input: String, outDir: String, maxDim: Int): List<String> {
        val dir = File(outDir).apply { mkdirs() }
        val out = ArrayList<String>()
        val stamp = System.currentTimeMillis()
        ParcelFileDescriptor.open(File(input), ParcelFileDescriptor.MODE_READ_ONLY).use { pfd ->
            PdfRenderer(pfd).use { renderer ->
                for (i in 0 until renderer.pageCount) {
                    renderer.openPage(i).use { page ->
                        val longest = max(page.width, page.height).toDouble()
                        val scale = (maxDim / longest).coerceIn(0.5, 4.0)
                        val w = max(1, (page.width * scale).toInt())
                        val h = max(1, (page.height * scale).toInt())
                        val bmp = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888)
                        bmp.eraseColor(Color.WHITE)
                        page.render(bmp, null, null, PdfRenderer.Page.RENDER_MODE_FOR_DISPLAY)
                        val f = File(dir, "pdf_${stamp}_$i.jpg")
                        FileOutputStream(f).use { bmp.compress(Bitmap.CompressFormat.JPEG, 90, it) }
                        bmp.recycle()
                        out.add(f.absolutePath)
                    }
                }
            }
        }
        return out
    }

    // --------------------------------------------------------------- image

    // --------------------------------------------------------- fit a size

    /**
     * Re-encodes an image smaller: scaled to at most [maxDim] on its longest
     * side, at JPEG [quality]. Returns the bytes written.
     *
     * The caller drives the search for a size, because only it knows what the
     * target is and whether a whole PDF or a single picture has to fit.
     */
    private fun compressImage(input: String, output: String, maxDim: Int, quality: Int): Int {
        val bounds = BitmapFactory.Options().apply { inJustDecodeBounds = true }
        BitmapFactory.decodeFile(input, bounds)
        val ow = bounds.outWidth
        val oh = bounds.outHeight
        if (ow <= 0 || oh <= 0) throw IllegalArgumentException("Cannot read the image.")
        // Ask the decoder for roughly the size we want rather than decoding a
        // 12 MP page in full and throwing most of it away.
        var sample = 1
        while (max(ow, oh) / (sample * 2) >= maxDim && sample < 16) sample *= 2
        var bmp = BitmapFactory.decodeFile(input, BitmapFactory.Options().apply { inSampleSize = sample })
            ?: throw IllegalArgumentException("Cannot decode the image.")
        try {
            val longest = max(bmp.width, bmp.height)
            if (longest > maxDim) {
                val k = maxDim.toFloat() / longest
                val scaled = Bitmap.createScaledBitmap(
                    bmp, max(1, (bmp.width * k).toInt()), max(1, (bmp.height * k).toInt()), true
                )
                if (scaled !== bmp) {
                    bmp.recycle()
                    bmp = scaled
                }
            }
            writeImage(bmp, output, quality)
            return File(output).length().toInt()
        } finally {
            if (!bmp.isRecycled) bmp.recycle()
        }
    }

    // ---------------------------------------------------------- pdf lock

    /**
     * Writes an encrypted copy of a PDF. The reader must type [password] to
     * open it at all — AES-256, which is what a bank or a lawyer expects.
     *
     * Ten of the scanner and PDF apps we looked at charge for this. It costs
     * us nothing: PDFBox is already in the app for merging.
     *
     * Printing and copying stay allowed. Locking a document people cannot
     * then print is a nuisance dressed as security, and the owner password is
     * set to the same one, so nobody is locked out of their own file.
     */
    private fun encryptPdf(input: String, output: String, password: String) {
        if (password.isEmpty()) throw IllegalArgumentException("A password is needed.")
        PDDocument.load(File(input)).use { doc ->
            val allowed = AccessPermission().apply {
                setCanPrint(true)
                setCanExtractContent(true)
                setCanModify(false)
                setCanModifyAnnotations(false)
            }
            val policy = StandardProtectionPolicy(password, password, allowed)
            policy.encryptionKeyLength = 256
            doc.protect(policy)
            val tmp = File(output + ".tmp")
            doc.save(tmp)
            val target = File(output)
            if (target.exists()) target.delete()
            if (!tmp.renameTo(target)) throw IllegalStateException("Cannot write the PDF.")
        }
    }

    // ----------------------------------------------------------- redact

    /**
     * Paints solid black over parts of a page and rewrites the file.
     *
     * This is the whole point: most apps draw a black box on TOP of a PDF and
     * leave the words underneath, where anyone can select and read them. That
     * is not redaction, it is a decoration over a leak. Here the pixels
     * themselves are replaced and the page is re-encoded, so what was under
     * the box is gone from the file. The caller is responsible for the other
     * two copies — the recognised text and the kept original.
     *
     * Rectangles are in the page's own pixels.
     */
    private fun redact(page: String, rects: List<Map<String, Any>>, quality: Int) {
        if (rects.isEmpty()) throw IllegalArgumentException("Nothing to cover.")
        val bmp = BitmapFactory.decodeFile(page, BitmapFactory.Options().apply { inMutable = true })
            ?: throw IllegalArgumentException("Cannot decode the page.")
        try {
            val canvas = android.graphics.Canvas(bmp)
            val paint = android.graphics.Paint().apply {
                color = Color.BLACK
                style = android.graphics.Paint.Style.FILL
                isAntiAlias = false // a soft edge would leave readable pixels
            }
            for (r in rects) {
                val x = (r["x"] as? Number)?.toFloat() ?: continue
                val y = (r["y"] as? Number)?.toFloat() ?: continue
                val w = (r["w"] as? Number)?.toFloat() ?: continue
                val h = (r["h"] as? Number)?.toFloat() ?: continue
                if (w <= 0 || h <= 0) continue
                canvas.drawRect(x, y, x + w, y + h, paint)
            }
            writeImage(bmp, page, quality)
        } finally {
            bmp.recycle()
        }
    }

    // --------------------------------------------------------- book mode

    /**
     * Splits a photograph of an open book into its two pages.
     *
     * The fold between the pages is the darkest vertical line near the middle:
     * the paper curves away there and the light never reaches it. So measure
     * the brightness of every column, smooth it, and take the darkest column
     * in the middle third. If nothing in there is meaningfully darker than the
     * paper, there is no fold to find and we cut down the exact middle rather
     * than inventing one.
     *
     * Writes the left page to [outLeft] and the right to [outRight]; the
     * caller decides which comes first, because an Arabic book reads the other
     * way round. Returns where it cut, as a fraction across the page, so the
     * user can be told when the guess was not the middle.
     */
    private fun splitSpread(
        input: String,
        outLeft: String,
        outRight: String,
        quality: Int
    ): Map<String, Any> {
        val full = BitmapFactory.decodeFile(input)
            ?: throw IllegalArgumentException("Cannot decode the image.")
        try {
            if (full.width < 2 || full.height < 2) {
                throw IllegalArgumentException("This picture is too small to split.")
            }
            val at = gutterOf(full)
            val cut = (full.width * at).toInt().coerceIn(1, full.width - 1)
            val left = Bitmap.createBitmap(full, 0, 0, cut, full.height)
            try {
                writeImage(left, outLeft, quality)
            } finally {
                if (left !== full) left.recycle()
            }
            val right = Bitmap.createBitmap(full, cut, 0, full.width - cut, full.height)
            try {
                writeImage(right, outRight, quality)
            } finally {
                if (right !== full) right.recycle()
            }
            return mapOf("at" to at)
        } finally {
            full.recycle()
        }
    }

    /** Where the fold is, as a fraction across the page. 0.5 when unsure. */
    private fun gutterOf(bmp: Bitmap): Float {
        // A narrow strip down the middle of the page is all we need, and
        // reading a small copy keeps this quick on a cheap phone.
        val w = min(bmp.width, GUTTER_SAMPLE_W)
        val h = min(bmp.height, GUTTER_SAMPLE_H)
        val small = Bitmap.createScaledBitmap(bmp, w, h, true)
        try {
            val px = IntArray(w * h)
            small.getPixels(px, 0, w, 0, 0, w, h)
            val column = FloatArray(w)
            for (x in 0 until w) {
                var sum = 0f
                for (y in 0 until h) {
                    val c = px[y * w + x]
                    // Rough luminance is plenty: we are looking for a shadow,
                    // not measuring colour.
                    sum += ((c shr 16 and 0xFF) * 3 + (c shr 8 and 0xFF) * 6 + (c and 0xFF)) / 10f
                }
                column[x] = sum / h
            }
            // Just enough smoothing to kill single-column speckle. Anything
            // wider erases the fold itself — a 16 px fold does not survive a
            // 33 px window, and a shallow one then goes missing entirely.
            val smooth = FloatArray(w)
            val r = max(1, w / 200)
            for (x in 0 until w) {
                var sum = 0f
                var n = 0
                for (i in max(0, x - r)..min(w - 1, x + r)) {
                    sum += column[i]
                    n++
                }
                smooth[x] = sum / n
            }
            val from = (w * (0.5f - GUTTER_SEARCH / 2)).toInt()
            val to = (w * (0.5f + GUTTER_SEARCH / 2)).toInt()
            var bestX = w / 2
            var best = Float.MAX_VALUE
            for (x in from until to) {
                if (smooth[x] < best) {
                    best = smooth[x]
                    bestX = x
                }
            }
            // Is it a narrow dark LINE, or just a dim area? Compare against
            // the columns a little way to each side.
            val d = max(2, (w * GUTTER_SHOULDER).toInt())
            val left = smooth[max(0, bestX - d)]
            val right = smooth[min(w - 1, bestX + d)]
            val drop = min(left, right) - best
            // No fold worth the name: cut down the middle rather than inventing one.
            if (drop < GUTTER_MIN_DROP) return 0.5f
            return bestX / w.toFloat()
        } catch (_: Throwable) {
            return 0.5f
        } finally {
            if (small !== bmp) small.recycle()
        }
    }

    // --------------------------------------------------------- one sheet

    /**
     * Lays several page images onto ONE white A4 sheet, stacked down the page
     * and each kept in proportion. The front and back of an ID card on a
     * single sheet is what people actually want this for, and it is the copy
     * every UAE office asks for. CamScanner and the rest charge for it.
     *
     * Works for any number of pictures, so it also does two receipts, or a
     * passport page and a visa, on one sheet.
     */
    private fun composeSheet(inputs: List<String>, output: String, quality: Int) {
        if (inputs.isEmpty()) throw IllegalArgumentException("Nothing to place on the sheet.")
        val sheet = Bitmap.createBitmap(SHEET_W, SHEET_H, Bitmap.Config.ARGB_8888)
        try {
            val canvas = android.graphics.Canvas(sheet)
            canvas.drawColor(Color.WHITE)
            val paint = android.graphics.Paint(
                android.graphics.Paint.FILTER_BITMAP_FLAG or android.graphics.Paint.ANTI_ALIAS_FLAG
            )
            val margin = SHEET_W * SHEET_MARGIN
            val gap = SHEET_W * SHEET_GAP
            val boxW = SHEET_W - 2 * margin
            val boxH = (SHEET_H - 2 * margin - gap * (inputs.size - 1)) / inputs.size
            var top = margin
            for (path in inputs) {
                val bmp = BitmapFactory.decodeFile(path)
                    ?: throw IllegalArgumentException("Cannot decode one of the pages.")
                try {
                    // Fit inside its slot without stretching: a stretched ID
                    // card is a rejected ID card.
                    val k = minOf(boxW / bmp.width, boxH / bmp.height)
                    val w = bmp.width * k
                    val h = bmp.height * k
                    val left = (SHEET_W - w) / 2f
                    val dst = android.graphics.RectF(left, top + (boxH - h) / 2f, left + w, top + (boxH + h) / 2f)
                    canvas.drawBitmap(bmp, null, dst, paint)
                } finally {
                    bmp.recycle()
                }
                top += boxH + gap
            }
            writeImage(sheet, output, quality)
        } finally {
            sheet.recycle()
        }
    }

    // ------------------------------------------------------------- enhance

    /**
     * Cleans up a page: takes out the shadow and the uneven light a phone
     * camera leaves on paper, evens the contrast, and can straighten a page
     * that was photographed crooked.
     *
     * This is Leptonica, which already travels inside the Tesseract library we
     * carry for Arabic, so it costs the app nothing. It matters because
     * Google's scanner does its own cleaning ONLY inside Google's camera
     * screen - a photo from the gallery or a page out of a PDF gets nothing.
     *
     * [mode] is auto (keeps the colour), grey, or bw (text only).
     * Returns the angle it straightened by, so the caller can say so.
     */
    private fun enhance(
        input: String,
        output: String,
        mode: String,
        straighten: Boolean,
        quality: Int
    ): Map<String, Any> {
        var bmp = BitmapFactory.decodeFile(input)
            ?: throw IllegalArgumentException("Cannot decode the image.")
        var angle = 0f
        val open = ArrayList<Pix>() // everything here is freed in the finally
        try {
            if (straighten) {
                angle = skewOf(bmp, open)
                if (kotlin.math.abs(angle) > SKEW_MIN_DEGREES) {
                    // Rotate the COLOUR bitmap ourselves rather than letting
                    // Leptonica rotate a reduced copy: the page keeps its pixels.
                    val m = Matrix().apply { postRotate(-angle) }
                    val r = Bitmap.createBitmap(bmp, 0, 0, bmp.width, bmp.height, m, true)
                    if (r !== bmp) {
                        bmp.recycle()
                        bmp = r
                    }
                } else {
                    angle = 0f
                }
            }

            if (mode != "none") {
                val src = ReadFile.readBitmap(bmp) ?: throw IllegalStateException("Cannot read the page.")
                open.add(src)
                var pix: Pix = src
                // Each step is allowed to fail. Leptonica rejects some depths
                // outright, and a page that comes back only half improved is
                // far better than one that throws in the user's face.
                fun step(name: String, op: (Pix) -> Pix?): Pix {
                    val next = try {
                        op(pix)
                    } catch (e: Throwable) {
                        CrashLog.append(activity, "enhance $mode: $name skipped: $e")
                        null
                    }
                    if (next == null || next === pix) return pix
                    open.add(next)
                    return next
                }
                if (mode == "auto") {
                    // Colour kept: flatten the lighting, then a gentle sharpen.
                    pix = step("backgroundNorm") { AdaptiveMap.backgroundNormMorph(it) }
                    pix = step("unsharp") { Enhance.unsharpMasking(it, 3, 0.3f) }
                } else {
                    // Grey and black-and-white both start from one grey plane,
                    // which is also the only depth contrast norm accepts.
                    pix = step("toGrey") { Convert.convertTo8(it) }
                    pix = step("backgroundNorm") { AdaptiveMap.backgroundNormMorph(it) }
                    pix = step("contrastNorm") { AdaptiveMap.pixContrastNorm(it) }
                    if (mode == "bw") {
                        pix = step("sauvola") { Binarize.sauvolaBinarizeTiled(it) }
                    } else {
                        pix = step("unsharp") { Enhance.unsharpMasking(it, 3, 0.3f) }
                    }
                }
                val out = WriteFile.writeBitmap(pix) ?: throw IllegalStateException("Cannot write the page.")
                bmp.recycle()
                bmp = out
            }

            writeImage(bmp, output, quality)
            return mapOf("angle" to angle)
        } finally {
            for (p in open) {
                try {
                    p.recycle()
                } catch (_: Throwable) {
                    // already gone; a leak here would be worse than a no-op
                }
            }
            if (!bmp.isRecycled) bmp.recycle()
        }
    }

    /** Degrees the text on this page runs off horizontal, 0 when unsure. */
    private fun skewOf(bmp: Bitmap, open: ArrayList<Pix>): Float {
        return try {
            val src = ReadFile.readBitmap(bmp) ?: return 0f
            open.add(src)
            val grey = Convert.convertTo8(src) ?: return 0f
            open.add(grey)
            // Finding skew needs a black-and-white page: it measures the lines
            // of text, not the picture.
            val bw = Binarize.otsuAdaptiveThreshold(grey) ?: return 0f
            open.add(bw)
            val a = Skew.findSkew(bw)
            if (a.isNaN() || kotlin.math.abs(a) > SKEW_MAX_DEGREES) 0f else a
        } catch (_: Throwable) {
            0f // a page we cannot measure is a page we leave alone
        }
    }

    private fun writeImage(bmp: Bitmap, output: String, quality: Int) {
        val target = File(output)
        val tmp = File(output + ".tmp")
        FileOutputStream(tmp).use {
            bmp.compress(Bitmap.CompressFormat.JPEG, quality.coerceIn(1, 100), it)
        }
        if (target.exists()) target.delete()
        if (!tmp.renameTo(target)) throw IllegalStateException("Cannot write the image.")
    }

    private fun transform(input: String, output: String, rotate: Int, format: String, quality: Int) {
        var bmp = BitmapFactory.decodeFile(input) ?: throw IllegalArgumentException("Cannot decode the image.")
        val deg = ((rotate % 360) + 360) % 360
        if (deg != 0) {
            val m = Matrix().apply { postRotate(deg.toFloat()) }
            val r = Bitmap.createBitmap(bmp, 0, 0, bmp.width, bmp.height, m, true)
            if (r !== bmp) {
                bmp.recycle()
                bmp = r
            }
        }
        val fmt = if (format == "png") Bitmap.CompressFormat.PNG else Bitmap.CompressFormat.JPEG
        val target = File(output)
        val tmp = File(output + ".tmp")
        FileOutputStream(tmp).use { bmp.compress(fmt, quality.coerceIn(1, 100), it) }
        bmp.recycle()
        if (target.exists()) target.delete()
        if (!tmp.renameTo(target)) throw IllegalStateException("Cannot write the image.")
    }

    /** Draws a transparent PNG (signature, stamp) onto a page and rewrites the JPEG. */
    private fun overlay(page: String, sticker: String, x: Int, y: Int, w: Int, h: Int) {
        if (w <= 0 || h <= 0) throw IllegalArgumentException("Nothing to draw.")
        val base = BitmapFactory.decodeFile(page, BitmapFactory.Options().apply { inMutable = true })
            ?: throw IllegalArgumentException("Cannot decode the page.")
        val stk = BitmapFactory.decodeFile(sticker)
            ?: throw IllegalArgumentException("Cannot decode the signature.")
        val canvas = android.graphics.Canvas(base)
        val paint = android.graphics.Paint(android.graphics.Paint.FILTER_BITMAP_FLAG or android.graphics.Paint.ANTI_ALIAS_FLAG)
        canvas.drawBitmap(
            stk, null,
            android.graphics.RectF(x.toFloat(), y.toFloat(), (x + w).toFloat(), (y + h).toFloat()),
            paint
        )
        stk.recycle()
        val target = File(page)
        val tmp = File(page + ".tmp")
        FileOutputStream(tmp).use { base.compress(Bitmap.CompressFormat.JPEG, 92, it) }
        base.recycle()
        if (target.exists()) target.delete()
        if (!tmp.renameTo(target)) throw IllegalStateException("Cannot write the page.")
    }

    /** The system "new contact" screen, pre-filled. No contacts permission is
     *  needed: the Contacts app does the saving after the user taps Save. */
    private fun buildContactIntent(f: Map<String, String>): Intent {
        val intent = Intent(Insert.ACTION).apply { type = android.provider.ContactsContract.RawContacts.CONTENT_TYPE }
        fun v(k: String): String? = f[k]?.trim()?.takeIf { it.isNotEmpty() }
        v("name")?.let { intent.putExtra(Insert.NAME, it) }
        v("company")?.let { intent.putExtra(Insert.COMPANY, it) }
        v("jobTitle")?.let { intent.putExtra(Insert.JOB_TITLE, it) }
        v("email")?.let {
            intent.putExtra(Insert.EMAIL, it)
            intent.putExtra(Insert.EMAIL_TYPE, android.provider.ContactsContract.CommonDataKinds.Email.TYPE_WORK)
        }
        v("notes")?.let { intent.putExtra(Insert.NOTES, it) }
        val phones = listOf(
            "mobile" to android.provider.ContactsContract.CommonDataKinds.Phone.TYPE_MOBILE,
            "phone" to android.provider.ContactsContract.CommonDataKinds.Phone.TYPE_WORK,
            "fax" to android.provider.ContactsContract.CommonDataKinds.Phone.TYPE_FAX_WORK
        ).mapNotNull { (k, t) -> v(k)?.let { it to t } }
        phones.getOrNull(0)?.let { (n, t) -> intent.putExtra(Insert.PHONE, n); intent.putExtra(Insert.PHONE_TYPE, t) }
        phones.getOrNull(1)?.let { (n, t) -> intent.putExtra(Insert.SECONDARY_PHONE, n); intent.putExtra(Insert.SECONDARY_PHONE_TYPE, t) }
        phones.getOrNull(2)?.let { (n, t) -> intent.putExtra(Insert.TERTIARY_PHONE, n); intent.putExtra(Insert.TERTIARY_PHONE_TYPE, t) }
        val data = ArrayList<ContentValues>()
        // Structured work address: street, city and country as separate fields.
        if (v("address") != null || v("city") != null || v("country") != null) {
            data.add(ContentValues().apply {
                put(android.provider.ContactsContract.Data.MIMETYPE, android.provider.ContactsContract.CommonDataKinds.StructuredPostal.CONTENT_ITEM_TYPE)
                put(android.provider.ContactsContract.CommonDataKinds.StructuredPostal.TYPE, android.provider.ContactsContract.CommonDataKinds.StructuredPostal.TYPE_WORK)
                v("address")?.let { put(android.provider.ContactsContract.CommonDataKinds.StructuredPostal.STREET, it) }
                v("city")?.let { put(android.provider.ContactsContract.CommonDataKinds.StructuredPostal.CITY, it) }
                v("country")?.let { put(android.provider.ContactsContract.CommonDataKinds.StructuredPostal.COUNTRY, it) }
            })
        }
        v("website")?.let {
            data.add(ContentValues().apply {
                put(android.provider.ContactsContract.Data.MIMETYPE, android.provider.ContactsContract.CommonDataKinds.Website.CONTENT_ITEM_TYPE)
                put(android.provider.ContactsContract.CommonDataKinds.Website.URL, it)
                put(android.provider.ContactsContract.CommonDataKinds.Website.TYPE, android.provider.ContactsContract.CommonDataKinds.Website.TYPE_WORK)
            })
        }
        v("photo")?.let { path -> contactPhoto(path)?.let { bytes ->
            data.add(ContentValues().apply {
                put(android.provider.ContactsContract.Data.MIMETYPE, android.provider.ContactsContract.CommonDataKinds.Photo.CONTENT_ITEM_TYPE)
                put(android.provider.ContactsContract.CommonDataKinds.Photo.PHOTO, bytes)
            })
        } }
        if (data.isNotEmpty()) intent.putParcelableArrayListExtra(Insert.DATA, data)
        return intent
    }

    /**
     * The card image, downsized so the contact editor accepts it. The whole
     * intent has to cross a Binder transaction, so the picture is compressed
     * until it is small enough instead of being dropped when the first try is
     * too big.
     */
    private fun contactPhoto(path: String): ByteArray? {
        return try {
            val bounds = BitmapFactory.Options().apply { inJustDecodeBounds = true }
            BitmapFactory.decodeFile(path, bounds)
            var sample = 1
            while (max(bounds.outWidth, bounds.outHeight) / sample > 1024) sample *= 2
            var bmp = BitmapFactory.decodeFile(path, BitmapFactory.Options().apply { inSampleSize = sample }) ?: return null
            var bytes: ByteArray? = null
            for (quality in intArrayOf(85, 70, 55, 40)) {
                val out = java.io.ByteArrayOutputStream()
                bmp.compress(Bitmap.CompressFormat.JPEG, quality, out)
                bytes = out.toByteArray()
                if (bytes.size <= PHOTO_LIMIT) break
            }
            // Still too big: halve the picture and try once more.
            if ((bytes?.size ?: 0) > PHOTO_LIMIT) {
                val half = Bitmap.createScaledBitmap(bmp, max(1, bmp.width / 2), max(1, bmp.height / 2), true)
                bmp.recycle()
                bmp = half
                val out = java.io.ByteArrayOutputStream()
                bmp.compress(Bitmap.CompressFormat.JPEG, 70, out)
                bytes = out.toByteArray()
            }
            bmp.recycle()
            bytes?.takeIf { it.size <= PHOTO_LIMIT }
        } catch (e: Throwable) {
            null
        }
    }

    private fun saveToGallery(path: String, mime: String, name: String): Boolean {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.Q) return false
        val values = ContentValues().apply {
            put(MediaStore.Images.Media.DISPLAY_NAME, name)
            put(MediaStore.Images.Media.MIME_TYPE, mime)
            put(MediaStore.Images.Media.RELATIVE_PATH, Environment.DIRECTORY_PICTURES + "/BRIDGE PHOTO")
            put(MediaStore.Images.Media.IS_PENDING, 1)
        }
        val resolver = activity.contentResolver
        val uri = resolver.insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, values) ?: return false
        resolver.openOutputStream(uri)!!.use { out ->
            File(path).inputStream().use { it.copyTo(out) }
        }
        values.clear()
        values.put(MediaStore.Images.Media.IS_PENDING, 0)
        resolver.update(uri, values, null, null)
        return true
    }
}
