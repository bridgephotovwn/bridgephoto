package app.bridgephoto

import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The two judgement calls, checked without a phone.
 *
 * Both of these decide what a mark on the page MEANS, and both can quietly do
 * real damage — one by scrubbing a pencil note off somebody's document, the
 * other by putting a colour cast on a white board. So the curve and the lift
 * are tested on their shape, not on how a screenshot looks.
 */
class PageCleanTest {

    /** A page: dark writing on the front, fainter writing showing through. */
    private fun page(inkAt: Int, bleedAt: Int, paperAt: Int): IntArray {
        val hist = IntArray(256)
        hist[inkAt] = 400        // the real writing
        hist[bleedAt] = 900      // what is coming through from the back
        hist[paperAt] = 12000    // the sheet
        val px = ArrayList<Int>()
        for (v in 0..255) repeat(hist[v]) {
            px.add((0xFF shl 24) or (v shl 16) or (v shl 8) or v)
        }
        return px.toIntArray()
    }

    @Test
    fun `writing on the back is lifted, writing on the front is not`() {
        val ink = 30
        val paper = 235
        val bleed = 195           // faint, as writing seen through a sheet is
        val lut = PageClean.showThroughCurve(
            PageClean.luminanceHistogram(page(ink, bleed, paper))
        )
        assertEquals("the real writing must not move at all", ink, lut[ink])
        assertEquals("paper must end up as paper", 255, lut[245])
        val before = paper - bleed
        val after = paper - lut[bleed]
        assertTrue(
            "show-through is still as strong as it was ($before -> $after)",
            after <= before / 2
        )
    }

    @Test
    fun `a mark the curve cannot judge is barely touched`() {
        // Deliberate, and the reason the curve eases in rather than stepping.
        // A mark sitting just above the knee is ambiguous - it could be show-
        // through, it could be a grey stamp - so it is left almost alone, and
        // only marks well clear of the knee are pushed hard. Erring here is
        // how a rubber stamp survives.
        val lut = PageClean.showThroughCurve(
            PageClean.luminanceHistogram(page(inkAt = 30, bleedAt = 195, paperAt = 235))
        )
        val knee = (30 + (235 - 30) * PageClean.SHOW_THROUGH_KNEE).toInt()
        assertTrue(
            "a mark just above the knee was moved a long way (${lut[knee + 2]})",
            lut[knee + 2] - (knee + 2) < 4
        )
    }

    @Test
    fun `a pencil note is NOT scrubbed off`() {
        // The mistake that matters. A soft pencil sits well above the ink but
        // below the knee, and it has to survive - losing it is somebody's
        // document damaged, while a little show-through left behind is only
        // untidy.
        val lut = PageClean.showThroughCurve(
            PageClean.luminanceHistogram(page(inkAt = 25, bleedAt = 170, paperAt = 240))
        )
        val knee = 25 + (240 - 25) * PageClean.SHOW_THROUGH_KNEE
        val pencil = (knee - 12).toInt()
        assertEquals("a pencil mark below the knee moved", pencil, lut[pencil])
    }

    @Test
    fun `a page with nothing to separate is left completely alone`() {
        // A flat grey photograph, or a page already cleaned: there is no gap
        // between ink and paper to judge by, so it must do nothing rather than
        // guess.
        val flat = IntArray(5000) { (0xFF shl 24) or (200 shl 16) or (200 shl 8) or 200 }
        val lut = PageClean.showThroughCurve(PageClean.luminanceHistogram(flat))
        for (v in 0..255) assertEquals("it changed a page it could not judge", v, lut[v])
    }

    @Test
    fun `the curve never darkens anything`() {
        val lut = PageClean.showThroughCurve(
            PageClean.luminanceHistogram(page(inkAt = 20, bleedAt = 140, paperAt = 230))
        )
        for (v in 0..255) {
            assertTrue("brightness $v was darkened to ${lut[v]}", lut[v] >= v)
        }
    }

    @Test
    fun `white stays white on a whiteboard`() {
        // The board itself is neutral. If lifting the colour tints it, every
        // photograph comes back looking like a bad filter.
        for (g in listOf(255, 240, 200, 128, 60)) {
            val c = (0xFF shl 24) or (g shl 16) or (g shl 8) or g
            val out = PageClean.liftPixel(c)
            val r = out shr 16 and 0xFF
            val gg = out shr 8 and 0xFF
            val b = out and 0xFF
            assertEquals("grey $g gained a red cast", r, gg)
            assertEquals("grey $g gained a blue cast", gg, b)
        }
    }

    @Test
    fun `a pale marker line is pushed further from grey`() {
        // a washed-out blue stroke
        val c = (0xFF shl 24) or (150 shl 16) or (160 shl 8) or 200
        val out = PageClean.liftPixel(c)
        val before = 200 - 150
        val after = (out and 0xFF) - (out shr 16 and 0xFF)
        assertTrue("the marker did not get stronger ($before -> $after)", after > before)
    }

    @Test
    fun `the alpha channel survives`() {
        val out = PageClean.liftPixel((0xFF shl 24) or (10 shl 16) or (200 shl 8) or 90)
        assertEquals(0xFF, (out ushr 24) and 0xFF)
    }
}
