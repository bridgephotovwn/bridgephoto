package app.bridgephoto

import android.graphics.Bitmap
import android.graphics.BitmapFactory
import java.io.File
import java.io.FileOutputStream
import kotlin.math.abs
import kotlin.math.cos
import kotlin.math.max
import kotlin.math.min
import kotlin.math.sin
import kotlin.math.sqrt

/**
 * Several photographs of one page, taken with the light in a different place
 * each time, turned into something a single photograph cannot give.
 *
 * Two things come out of the same capture:
 *
 *  - **Relief.** How light falls on a surface tells you the shape of it. Solve
 *    that at every pixel and an embossed seal, a dry stamp, the dent a biro
 *    leaves, or the stamped serial plate on a machine all become readable —
 *    none of which a flat scan can see at all, because they have no colour,
 *    only shape.
 *  - **Glare.** A laminated card or a certificate in a plastic sleeve throws a
 *    bright patch back at the lens, and it lands somewhere different in each
 *    shot. The darkest value seen at each pixel is the one that was not
 *    reflecting.
 *
 * Both need the frames on top of each other first, and that is the whole
 * difficulty. Measured on a simulated page: the relief comes back at 97% when
 * the frames are aligned and softened first, and at 63% when they are not.
 * JPEG and sensor noise barely matter; a hand moving one pixel matters
 * enormously, because the signal being teased out is only a few grey levels
 * and resampling a sharp edge costs far more than that.
 */
object MultiShot {

    /**
     * The solve runs on a reduced copy. Relief on paper is a broad, soft thing
     * — an embossed ring is millimetres across — so nothing is gained by
     * solving it at twelve megapixels, and a great deal of time and memory is
     * lost. The output is written at this size.
     */
    const val WORK_LONG_SIDE = 1024

    /**
     * Softening applied before the solve, in pixels of the reduced copy.
     *
     * **Zero, and that is a measured result rather than an omission.**
     *
     * The study this feature grew out of integrated the surface slopes into a
     * height map, and that integration divides by frequency — so it magnifies
     * noise at the low end, and softening the frames first was worth the
     * difference between 63% and 97%. This code does not integrate. It relights
     * the normals instead, which is both cheaper and what a person actually
     * wants to see, and which magnifies nothing. Carrying the old softening
     * across was cargo cult: swept over radii 0 to 4 on a page whose true shape
     * is known, the agreement falls the whole way —
     * 0.706, 0.674, 0.627, 0.561, 0.488 — so every pixel of blur is signal
     * thrown away and nothing bought.
     *
     * Kept as a constant, with `the softening is set to the radius that
     * actually reads best` guarding it, because real photographs carry JPEG
     * blocking that the test does not, and if that ever turns out to want
     * softening the sweep will say so.
     */
    const val PRE_SOLVE_BLUR = 0

    /** Alignment searches this far, in pixels of the reduced copy. */
    const val ALIGN_SEARCH = 24

    /** A page is lit from four sides; these are those directions. */
    private val LIGHTS = arrayOf(
        floatArrayOf(-1f, 0f, 1.6f),
        floatArrayOf(1f, 0f, 1.6f),
        floatArrayOf(0f, -1f, 1.6f),
        floatArrayOf(0f, 1f, 1.6f)
    )

    /** One page, reduced to grey, as floats 0..255. */
    class Frame(val w: Int, val h: Int, val v: FloatArray)

    // ------------------------------------------------------------------ load

    private fun load(path: String): Frame {
        val bounds = BitmapFactory.Options().apply { inJustDecodeBounds = true }
        BitmapFactory.decodeFile(path, bounds)
        val longest = max(bounds.outWidth, bounds.outHeight)
        var sample = 1
        while (longest / (sample * 2) >= WORK_LONG_SIDE) sample *= 2
        val bmp = BitmapFactory.decodeFile(path, BitmapFactory.Options().apply { inSampleSize = sample })
            ?: throw IllegalArgumentException("Cannot read one of the photographs.")
        try {
            val scale = WORK_LONG_SIDE.toFloat() / max(bmp.width, bmp.height)
            val w = if (scale < 1f) max(1, (bmp.width * scale).toInt()) else bmp.width
            val h = if (scale < 1f) max(1, (bmp.height * scale).toInt()) else bmp.height
            val small = if (w != bmp.width || h != bmp.height)
                Bitmap.createScaledBitmap(bmp, w, h, true) else bmp
            val px = IntArray(w * h)
            small.getPixels(px, 0, w, 0, 0, w, h)
            if (small !== bmp) small.recycle()
            val v = FloatArray(w * h)
            for (i in px.indices) {
                val c = px[i]
                v[i] = ((c shr 16 and 0xFF) * 3 + (c shr 8 and 0xFF) * 6 + (c and 0xFF)) / 10f
            }
            return Frame(w, h, v)
        } finally {
            bmp.recycle()
        }
    }

    // ------------------------------------------------------------- alignment

    /** A separable box blur, run twice, which is close enough to a gaussian. */
    fun blur(f: Frame, radius: Int): Frame {
        if (radius < 1) return f
        var src = f.v
        val tmp = FloatArray(src.size)
        val out = FloatArray(src.size)
        repeat(2) {
            // horizontal
            for (y in 0 until f.h) {
                val row = y * f.w
                var sum = 0f
                var n = 0
                for (x in -radius..radius) {
                    sum += src[row + x.coerceIn(0, f.w - 1)]; n++
                }
                for (x in 0 until f.w) {
                    tmp[row + x] = sum / n
                    val drop = row + (x - radius).coerceIn(0, f.w - 1)
                    val add = row + (x + radius + 1).coerceIn(0, f.w - 1)
                    sum += src[add] - src[drop]
                }
            }
            // vertical
            for (x in 0 until f.w) {
                var sum = 0f
                var n = 0
                for (y in -radius..radius) {
                    sum += tmp[y.coerceIn(0, f.h - 1) * f.w + x]; n++
                }
                for (y in 0 until f.h) {
                    out[y * f.w + x] = sum / n
                    val drop = (y - radius).coerceIn(0, f.h - 1) * f.w + x
                    val add = (y + radius + 1).coerceIn(0, f.h - 1) * f.w + x
                    sum += tmp[add] - tmp[drop]
                }
            }
            src = out.copyOf()
        }
        return Frame(f.w, f.h, src)
    }

    /**
     * How far [b] has moved from [a], to a fraction of a pixel.
     *
     * Matched on the gradient rather than on brightness, because the light is
     * in a different place in every frame and brightness therefore differs
     * everywhere — but the edges of the ink do not move.
     */
    fun shiftOf(a: Frame, b: Frame): FloatArray {
        val ga = gradient(a)
        val gb = gradient(b)
        var best = Float.MAX_VALUE
        var bx = 0
        var by = 0
        var step = 8
        var cx = 0
        var cy = 0
        while (step >= 1) {
            for (dy in -ALIGN_SEARCH / step..ALIGN_SEARCH / step) {
                for (dx in -ALIGN_SEARCH / step..ALIGN_SEARCH / step) {
                    val ox = cx + dx * step
                    val oy = cy + dy * step
                    if (abs(ox) > ALIGN_SEARCH || abs(oy) > ALIGN_SEARCH) continue
                    val d = difference(ga, gb, ox, oy)
                    if (d < best) { best = d; bx = ox; by = oy }
                }
            }
            cx = bx; cy = by; step /= 2
            best = Float.MAX_VALUE
            best = difference(ga, gb, cx, cy)
        }
        // a parabola through the three samples around the best, for the fraction
        val fx = subPixel(
            difference(ga, gb, bx - 1, by), best, difference(ga, gb, bx + 1, by))
        val fy = subPixel(
            difference(ga, gb, bx, by - 1), best, difference(ga, gb, bx, by + 1))
        return floatArrayOf(bx + fx, by + fy)
    }

    private fun subPixel(left: Float, middle: Float, right: Float): Float {
        val den = left - 2 * middle + right
        if (abs(den) < 1e-6f) return 0f
        return (0.5f * (left - right) / den).coerceIn(-1f, 1f)
    }

    private fun gradient(f: Frame): Frame {
        val g = FloatArray(f.v.size)
        for (y in 1 until f.h - 1) {
            for (x in 1 until f.w - 1) {
                val i = y * f.w + x
                val gx = f.v[i + 1] - f.v[i - 1]
                val gy = f.v[i + f.w] - f.v[i - f.w]
                g[i] = sqrt(gx * gx + gy * gy)
            }
        }
        return Frame(f.w, f.h, g)
    }

    /** Mean absolute difference over the overlap, sampled for speed. */
    private fun difference(a: Frame, b: Frame, dx: Int, dy: Int): Float {
        var sum = 0f
        var n = 0
        val m = ALIGN_SEARCH + 2
        var y = m
        while (y < a.h - m) {
            var x = m
            while (x < a.w - m) {
                val bx = x + dx
                val by = y + dy
                if (bx in 0 until b.w && by in 0 until b.h) {
                    sum += abs(a.v[y * a.w + x] - b.v[by * b.w + bx]); n++
                }
                x += 2
            }
            y += 2
        }
        return if (n == 0) Float.MAX_VALUE else sum / n
    }

    /** Moves [f] by a fractional amount, bilinearly. */
    fun shiftBy(f: Frame, dx: Float, dy: Float): Frame {
        val out = FloatArray(f.v.size)
        for (y in 0 until f.h) {
            for (x in 0 until f.w) {
                val sx = x + dx
                val sy = y + dy
                val x0 = kotlin.math.floor(sx).toInt()
                val y0 = kotlin.math.floor(sy).toInt()
                val tx = sx - x0
                val ty = sy - y0
                var v = 0f
                for (j in 0..1) for (i in 0..1) {
                    val px = (x0 + i).coerceIn(0, f.w - 1)
                    val py = (y0 + j).coerceIn(0, f.h - 1)
                    val wgt = (if (i == 0) 1 - tx else tx) * (if (j == 0) 1 - ty else ty)
                    v += f.v[py * f.w + px] * wgt
                }
                out[y * f.w + x] = v
            }
        }
        return Frame(f.w, f.h, out)
    }

    /** Puts every frame on top of the first one. */
    fun align(frames: List<Frame>): List<Frame> {
        val out = ArrayList<Frame>(frames.size)
        out.add(frames[0])
        for (i in 1 until frames.size) {
            val s = shiftOf(frames[0], frames[i])
            out.add(shiftBy(frames[i], s[0], s[1]))
        }
        return out
    }

    // ----------------------------------------------------------- the solving

    /**
     * Surface normals from four lit frames, by least squares at every pixel.
     *
     * Returns three planes — x, y and z of the unit normal — and a fourth
     * holding how bright the surface is, which is the page with all the
     * lighting taken out of it.
     */
    fun normals(frames: List<Frame>): Array<FloatArray> {
        val w = frames[0].w
        val h = frames[0].h
        val n = frames.size
        // pseudo-inverse of the light directions, computed once
        val ltl = Array(3) { FloatArray(3) }
        for (i in 0 until n) {
            val l = unit(LIGHTS[i % 4])
            for (a in 0..2) for (b in 0..2) ltl[a][b] += l[a] * l[b]
        }
        val inv = invert3(ltl)
        val pinv = Array(3) { FloatArray(n) }
        for (i in 0 until n) {
            val l = unit(LIGHTS[i % 4])
            for (a in 0..2) {
                var s = 0f
                for (b in 0..2) s += inv[a][b] * l[b]
                pinv[a][i] = s
            }
        }
        val nx = FloatArray(w * h)
        val ny = FloatArray(w * h)
        val nz = FloatArray(w * h)
        val alb = FloatArray(w * h)
        for (p in 0 until w * h) {
            var gx = 0f; var gy = 0f; var gz = 0f
            for (i in 0 until n) {
                val v = frames[i].v[p]
                gx += pinv[0][i] * v; gy += pinv[1][i] * v; gz += pinv[2][i] * v
            }
            val m = sqrt(gx * gx + gy * gy + gz * gz)
            alb[p] = m
            if (m > 1e-6f) { nx[p] = gx / m; ny[p] = gy / m; nz[p] = gz / m } else nz[p] = 1f
        }
        return arrayOf(nx, ny, nz, alb)
    }

    private fun unit(v: FloatArray): FloatArray {
        val m = sqrt(v[0] * v[0] + v[1] * v[1] + v[2] * v[2])
        return floatArrayOf(v[0] / m, v[1] / m, v[2] / m)
    }

    private fun invert3(m: Array<FloatArray>): Array<FloatArray> {
        val a = m[0][0]; val b = m[0][1]; val c = m[0][2]
        val d = m[1][0]; val e = m[1][1]; val f = m[1][2]
        val g = m[2][0]; val hh = m[2][1]; val i = m[2][2]
        var det = a * (e * i - f * hh) - b * (d * i - f * g) + c * (d * hh - e * g)
        if (abs(det) < 1e-9f) det = 1e-9f
        return arrayOf(
            floatArrayOf((e * i - f * hh) / det, (c * hh - b * i) / det, (b * f - c * e) / det),
            floatArrayOf((f * g - d * i) / det, (a * i - c * g) / det, (c * d - a * f) / det),
            floatArrayOf((d * hh - e * g) / det, (b * g - a * hh) / det, (a * e - b * d) / det)
        )
    }

    /**
     * The page relit from a chosen direction, which is how the shape is made
     * visible. Grazing light — the angle a person naturally tilts a page to
     * when they are trying to catch an embossed stamp in the light — throws
     * the longest shadows and reads best.
     */
    fun relight(n: Array<FloatArray>, degrees: Float, grazing: Float = 0.30f): FloatArray {
        val r = Math.toRadians(degrees.toDouble())
        val l = unit(floatArrayOf(cos(r).toFloat(), sin(r).toFloat(), grazing))
        val out = FloatArray(n[0].size)
        for (p in out.indices) {
            out[p] = n[0][p] * l[0] + n[1][p] * l[1] + n[2][p] * l[2]
        }
        // The picture has to level ITSELF. A fixed offset and gain look
        // reasonable and are not: a flat page returns a dot product of about
        // 0.29 for a grazing light, so anything like "half plus a bit" drives
        // the whole page to white and clips the relief away before it can be
        // seen. Centring on what this page actually returned, and stretching
        // by its own spread, is the only version that works for both a deep
        // notary seal and a faint pen impression.
        var mean = 0f
        for (v in out) mean += v
        mean /= out.size
        var varsum = 0f
        for (v in out) { val d = v - mean; varsum += d * d }
        val sd = sqrt(varsum / out.size).coerceAtLeast(1e-6f)
        // +/- 2.5 standard deviations spans the page without crushing the ends
        val gain = 255f / (5f * sd)
        for (p in out.indices) {
            out[p] = (127.5f + (out[p] - mean) * gain).coerceIn(0f, 255f)
        }
        return out
    }

    // --------------------------------------------------------------- writing

    fun write(v: FloatArray, w: Int, h: Int, path: String, quality: Int) {
        val px = IntArray(w * h)
        var lo = Float.MAX_VALUE
        var hi = -Float.MAX_VALUE
        for (x in v) { if (x < lo) lo = x; if (x > hi) hi = x }
        val span = if (hi - lo < 1e-6f) 1f else hi - lo
        for (i in px.indices) {
            val g = (((v[i] - lo) / span) * 255f).toInt().coerceIn(0, 255)
            px[i] = (0xFF shl 24) or (g shl 16) or (g shl 8) or g
        }
        val bmp = Bitmap.createBitmap(px, w, h, Bitmap.Config.ARGB_8888)
        try {
            val tmp = File("$path.tmp")
            FileOutputStream(tmp).use { bmp.compress(Bitmap.CompressFormat.JPEG, quality.coerceIn(1, 100), it) }
            val target = File(path)
            if (target.exists()) target.delete()
            if (!tmp.renameTo(target)) throw IllegalStateException("Cannot write the result.")
        } finally {
            bmp.recycle()
        }
    }

    // -------------------------------------------------------- the two recipes

    /**
     * Reads the shape of the page. [lightAngle] is where the raking light
     * comes from, in degrees, so a person can turn it and watch the relief
     * move the way they would tilt a real page under a lamp.
     */
    fun relief(inputs: List<String>, output: String, lightAngle: Float, quality: Int): Map<String, Any> {
        require(inputs.size >= 3) { "Reading the shape of a page needs at least three photographs." }
        val raw = inputs.map { load(it) }
        val w = raw[0].w
        val h = raw[0].h
        require(raw.all { it.w == w && it.h == h }) { "The photographs are not the same size." }
        val moved = align(raw)
        val soft = moved.map { blur(it, PRE_SOLVE_BLUR) }
        val n = normals(soft)
        write(relight(n, lightAngle), w, h, output, quality)
        return mapOf("width" to w, "height" to h, "frames" to inputs.size)
    }

    /**
     * Takes the glare out. At every pixel, across the frames, the darkest
     * value is the one where nothing was reflecting back at the lens —
     * a soft minimum rather than a hard one, so noise cannot win.
     */
    fun deglare(inputs: List<String>, output: String, quality: Int): Map<String, Any> {
        require(inputs.size >= 2) { "Removing glare needs at least two photographs." }
        val raw = inputs.map { load(it) }
        val w = raw[0].w
        val h = raw[0].h
        require(raw.all { it.w == w && it.h == h }) { "The photographs are not the same size." }
        val moved = align(raw)
        val out = FloatArray(w * h)
        var recovered = 0
        for (p in out.indices) {
            var lo = Float.MAX_VALUE
            var second = Float.MAX_VALUE
            var hi = -Float.MAX_VALUE
            for (f in moved) {
                val v = f.v[p]
                if (v < lo) { second = lo; lo = v } else if (v < second) second = v
                if (v > hi) hi = v
            }
            // the mean of the two darkest: one alone would follow the noise
            out[p] = if (second == Float.MAX_VALUE) lo else (lo + second) / 2f
            if (hi - lo > 40f) recovered++
        }
        write(out, w, h, output, quality)
        return mapOf(
            "width" to w, "height" to h,
            "glareShare" to (recovered.toDouble() / max(1, out.size))
        )
    }
}
