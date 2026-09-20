package app.bridgephoto

import android.graphics.Bitmap
import kotlin.math.max
import kotlin.math.min

/**
 * Two cleanups that the Leptonica pipeline cannot express, because both need
 * to make a judgement about what the marks on the page MEAN rather than only
 * about how bright they are.
 */
object PageClean {

    // ------------------------------------------------------- show-through

    /**
     * How far between the ink and the paper the knee sits, as a share.
     *
     * Writing on the back of a thin sheet shows through at perhaps half the
     * strength of the writing on the front — that is the whole signal, and it
     * is the only thing separating the two. Below the knee is the real page
     * and is left alone; above it the mark is lifted towards the paper, and
     * the further above, the harder.
     *
     * Deliberately past the halfway mark. The two mistakes are not equal: a
     * little show-through left behind is untidy, while a pencil note or a grey
     * rubber stamp scrubbed off the page is somebody's document damaged.
     */
    const val SHOW_THROUGH_KNEE = 0.58f

    /** Below this much contrast on the page, there is nothing to judge. */
    const val MIN_RANGE = 40

    /**
     * Lifts the writing on the BACK of a thin sheet off the front of it.
     *
     * The levels are taken from the page itself rather than fixed, because a
     * newspaper, a carbon copy and a bank statement have nothing in common
     * except that the show-through is fainter than the writing.
     */
    fun suppressShowThrough(bmp: Bitmap): Bitmap {
        val w = bmp.width
        val h = bmp.height
        val px = IntArray(w * h)
        bmp.getPixels(px, 0, w, 0, 0, w, h)
        val lut = showThroughCurve(luminanceHistogram(px))
        for (i in px.indices) {
            val c = px[i]
            val r = c shr 16 and 0xFF
            val g = c shr 8 and 0xFF
            val b = c and 0xFF
            val y = (r * 3 + g * 6 + b) / 10
            val lifted = lut[y]
            if (lifted == y) continue
            // move the colour towards paper by the same proportion, so a
            // coloured stamp fades as a whole instead of turning grey
            val k = (lifted - y)
            px[i] = (c.toLong() and 0xFF000000L).toInt() or
                (min(255, r + k) shl 16) or (min(255, g + k) shl 8) or min(255, b + k)
        }
        val out = Bitmap.createBitmap(px, w, h, Bitmap.Config.ARGB_8888)
        bmp.recycle()
        return out
    }

    /** Counts of each brightness on the page. */
    fun luminanceHistogram(px: IntArray): IntArray {
        val hist = IntArray(256)
        for (c in px) {
            val y = ((c shr 16 and 0xFF) * 3 + (c shr 8 and 0xFF) * 6 + (c and 0xFF)) / 10
            hist[y]++
        }
        return hist
    }

    /**
     * The brightness-to-brightness map that does the lifting. Public and pure
     * so the shape of it can be checked without a phone.
     */
    fun showThroughCurve(hist: IntArray): IntArray {
        val total = hist.sum().coerceAtLeast(1)
        val ink = percentile(hist, total, 0.02f)      // the darkest real writing
        val paper = percentile(hist, total, 0.92f)    // the sheet itself
        val lut = IntArray(256) { it }
        if (paper - ink < MIN_RANGE) return lut       // nothing to separate
        val knee = ink + (paper - ink) * SHOW_THROUGH_KNEE
        for (v in 0..255) {
            if (v <= knee) continue                   // the real page, untouched
            if (v >= paper) { lut[v] = 255; continue }
            // between the knee and the paper, ease it up to the paper level
            val t = (v - knee) / (paper - knee)
            val eased = t * t * (3 - 2 * t)           // smooth at both ends
            lut[v] = (v + (paper - v) * eased).toInt().coerceIn(0, 255)
        }
        for (v in paper.toInt()..255) lut[v] = 255
        return lut
    }

    private fun percentile(hist: IntArray, total: Int, p: Float): Float {
        var seen = 0
        val want = (total * p).toInt()
        for (v in 0..255) {
            seen += hist[v]
            if (seen >= want) return v.toFloat()
        }
        return 255f
    }

    // ---------------------------------------------------------- whiteboard

    /** How much the marker colour is pushed up. 1.0 would change nothing. */
    const val COLOUR_LIFT = 1.9f

    /**
     * Brings a whiteboard's marker colours back.
     *
     * A drying marker photographs as a pale wash of what the eye sees on the
     * board, and flattening the light fades it further, because the correction
     * cannot tell a weak blue line from a slightly blue-grey board. Pushing
     * each pixel away from its own grey restores the pen without touching
     * anything that was already neutral — so the board stays white and does
     * not acquire a colour cast.
     */
    fun liftColour(bmp: Bitmap): Bitmap {
        val w = bmp.width
        val h = bmp.height
        val px = IntArray(w * h)
        bmp.getPixels(px, 0, w, 0, 0, w, h)
        for (i in px.indices) {
            px[i] = liftPixel(px[i])
        }
        val out = Bitmap.createBitmap(px, w, h, Bitmap.Config.ARGB_8888)
        bmp.recycle()
        return out
    }

    /** One pixel pushed away from grey. Pure, so it can be checked. */
    fun liftPixel(c: Int): Int {
        val a = c.toLong() and 0xFF000000L
        val r = c shr 16 and 0xFF
        val g = c shr 8 and 0xFF
        val b = c and 0xFF
        val grey = (r * 3 + g * 6 + b) / 10
        val nr = (grey + (r - grey) * COLOUR_LIFT).toInt().coerceIn(0, 255)
        val ng = (grey + (g - grey) * COLOUR_LIFT).toInt().coerceIn(0, 255)
        val nb = (grey + (b - grey) * COLOUR_LIFT).toInt().coerceIn(0, 255)
        // darken what is already coloured a little, so a pale line reads as a
        // line rather than as a tint
        val strength = max(max(nr, ng), nb) - min(min(nr, ng), nb)
        val dim = if (strength > 24) 1f - min(0.22f, strength / 640f) else 1f
        return a.toInt() or
            ((nr * dim).toInt().coerceIn(0, 255) shl 16) or
            ((ng * dim).toInt().coerceIn(0, 255) shl 8) or
            (nb * dim).toInt().coerceIn(0, 255)
    }
}
