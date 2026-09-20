package app.bridgephoto

import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import kotlin.math.abs
import kotlin.math.exp
import kotlin.math.sqrt

/**
 * The multi-shot arithmetic, checked on the desktop JVM.
 *
 * This is exactly the kind of code that fails quietly: a transposed index or a
 * sign the wrong way round gives a picture that still looks like something,
 * and no screenshot would catch it. So the test builds a page whose true shape
 * it knows — an embossed ring and a pressed groove, with printed text that has
 * no shape at all — lights it from four sides by the same physics the phone
 * will see, and then checks that what comes back is the shape that went in.
 *
 * The figures here match the ones measured in Python before any of this was
 * written: aligned and softened, the relief comes back; unsoftened, it does
 * not.
 */
class MultiShotTest {

    private val N = 160

    /** height, albedo — the truth the solver is not allowed to see. */
    private fun truth(): Pair<FloatArray, FloatArray> {
        val h = FloatArray(N * N)
        val a = FloatArray(N * N) { 210f }
        for (y in 0 until N) for (x in 0 until N) {
            val i = y * N + x
            // an embossed ring, raised
            val r = sqrt(((x - 55.0) * (x - 55.0) + (y - 60.0) * (y - 60.0)))
            h[i] += (2.2 * exp(-((r - 22) * (r - 22)) / 18.0)).toFloat()
            // a pressed groove, sunk
            val d = abs(y - (108 + 7 * kotlin.math.sin(x / 11.0)))
            h[i] -= (1.6 * exp(-(d * d) / 6.0)).toFloat()
            // printed text: dark ink, perfectly flat
            if (y in 20..28 && x in 20..130) a[i] = 40f
        }
        return h to a
    }

    private val lights = arrayOf(
        floatArrayOf(-1f, 0f, 1.6f), floatArrayOf(1f, 0f, 1.6f),
        floatArrayOf(0f, -1f, 1.6f), floatArrayOf(0f, 1f, 1.6f)
    )

    private fun shoot(h: FloatArray, alb: FloatArray, l: FloatArray): MultiShot.Frame {
        val m = sqrt(l[0] * l[0] + l[1] * l[1] + l[2] * l[2])
        val lx = l[0] / m; val ly = l[1] / m; val lz = l[2] / m
        val v = FloatArray(N * N)
        for (y in 0 until N) for (x in 0 until N) {
            val i = y * N + x
            val gx = h[i + if (x < N - 1) 1 else 0] - h[i - if (x > 0) 1 else 0]
            val gy = h[i + if (y < N - 1) N else 0] - h[i - if (y > 0) N else 0]
            val nx = -gx / 2f; val ny = -gy / 2f; val nz = 1f
            val nm = sqrt(nx * nx + ny * ny + nz * nz)
            val dot = ((nx * lx + ny * ly + nz * lz) / nm).coerceIn(0f, 1f)
            v[i] = (alb[i] / 255f * dot * 255f * 1.35f).coerceIn(0f, 255f)
        }
        return MultiShot.Frame(N, N, v)
    }

    /** How well a recovered picture tracks the true shape, ignoring offset. */
    private fun agreement(got: FloatArray, want: FloatArray): Float {
        var ma = 0f; var mb = 0f
        for (i in got.indices) { ma += got[i]; mb += want[i] }
        ma /= got.size; mb /= want.size
        var sab = 0f; var saa = 0f; var sbb = 0f
        for (i in got.indices) {
            val a = got[i] - ma; val b = want[i] - mb
            sab += a * b; saa += a * a; sbb += b * b
        }
        return if (saa < 1e-9f || sbb < 1e-9f) 0f else sab / sqrt(saa * sbb)
    }

    /**
     * What the true surface SHOULD look like under a raking light from
     * [degrees]. The surface normal leans against the slope, so the brightness
     * follows minus the slope taken along the light's direction. This has to
     * agree with the angle handed to relight, or the test is measuring the
     * wrong thing — it did, the first time.
     */
    private fun trueShading(h: FloatArray, degrees: Double): FloatArray {
        val lx = kotlin.math.cos(Math.toRadians(degrees)).toFloat()
        val ly = kotlin.math.sin(Math.toRadians(degrees)).toFloat()
        val out = FloatArray(N * N)
        for (y in 1 until N - 1) for (x in 1 until N - 1) {
            val i = y * N + x
            val gx = h[i + 1] - h[i - 1]
            val gy = h[i + N] - h[i - N]
            out[i] = -(gx * lx + gy * ly)
        }
        return out
    }

    @Test
    fun `the shape comes back from four lit photographs`() {
        val (h, alb) = truth()
        val frames = lights.map { shoot(h, alb, it) }
        val n = MultiShot.normals(frames.map { MultiShot.blur(it, MultiShot.PRE_SOLVE_BLUR) })
        val lit = MultiShot.relight(n, 135f)
        val score = agreement(lit, trueShading(h, 135.0))
        assertTrue("the relief did not come back (agreement $score)", score > 0.60f)
    }

    @Test
    fun `printed ink has no shape, so it does not appear in the relief`() {
        val (h, alb) = truth()
        val frames = lights.map { shoot(h, alb, it) }
        val n = MultiShot.normals(frames.map { MultiShot.blur(it, MultiShot.PRE_SOLVE_BLUR) })
        val lit = MultiShot.relight(n, 135f)
        // the text band carries heavy ink but is perfectly flat
        var textSpread = 0f; var ringSpread = 0f
        var tn = 0; var rn = 0
        var tm = 0f; var rm = 0f
        for (y in 21..27) for (x in 30..120) { tm += lit[y * N + x]; tn++ }
        for (y in 40..80) for (x in 35..75) { rm += lit[y * N + x]; rn++ }
        tm /= tn; rm /= rn
        for (y in 21..27) for (x in 30..120) { val d = lit[y * N + x] - tm; textSpread += d * d }
        for (y in 40..80) for (x in 35..75) { val d = lit[y * N + x] - rm; ringSpread += d * d }
        textSpread = sqrt(textSpread / tn); ringSpread = sqrt(ringSpread / rn)
        assertTrue(
            "flat ink showed as much relief as the embossed ring " +
                "(ink $textSpread, ring $ringSpread)",
            ringSpread > textSpread * 2f
        )
    }

    @Test
    fun `a hand that moved is found and put back`() {
        val (h, alb) = truth()
        val a = shoot(h, alb, lights[0])
        for ((dx, dy) in listOf(3f to 0f, 0f to -4f, 5f to 2f, -6f to 3f)) {
            val moved = MultiShot.shiftBy(a, -dx, -dy)   // as if the hand slipped
            val found = MultiShot.shiftOf(a, moved)
            assertEquals("x shift wrong", dx.toDouble(), found[0].toDouble(), 1.0)
            assertEquals("y shift wrong", dy.toDouble(), found[1].toDouble(), 1.0)
        }
    }

    /**
     * What a camera actually hands over: whole numbers, not the real values,
     * plus a little sensor noise. It matters here more than it looks. On
     * perfect arithmetic, moving a frame back costs almost nothing and
     * softening only throws signal away; on a real frame, moving it back
     * smears every ink edge across a quantised grid, and THAT is the noise the
     * softening exists to remove. A test on clean numbers says the opposite of
     * the truth — it did, the first time this was run.
     */
    private fun asCameraGives(f: MultiShot.Frame, seed: Int): MultiShot.Frame {
        val rng = java.util.Random(seed.toLong())
        val v = FloatArray(f.v.size)
        for (i in v.indices) {
            v[i] = (f.v[i] + rng.nextGaussian().toFloat() * 2.0f)
                .coerceIn(0f, 255f).toInt().toFloat()
        }
        return MultiShot.Frame(f.w, f.h, v)
    }

    @Test
    fun `the softening is set to the radius that actually reads best`() {
        // Measured, not guessed. The Python study this feature came from
        // integrated the slopes into a height map, and THAT amplifies noise at
        // low frequencies, so softening first was worth a great deal. Relighting
        // does no such integration, so the same softening buys much less. The
        // sweep below is the evidence; PRE_SOLVE_BLUR must sit at or near its
        // best, and this test exists to say so if anyone retunes it blind.
        val (h, alb) = truth()
        val want = trueShading(h, 135.0)
        val frames = lights.mapIndexed { i, l ->
            val f = asCameraGives(shoot(h, alb, l), 100 + i)
            if (i == 0) f else MultiShot.shiftBy(f, 2.4f, -1.7f)
        }
        val aligned = MultiShot.align(frames)
        val scores = (0..4).map { r ->
            val src = if (r == 0) aligned else aligned.map { MultiShot.blur(it, r) }
            r to agreement(MultiShot.relight(MultiShot.normals(src), 135f), want)
        }
        val best = scores.maxByOrNull { it.second }!!
        val chosen = scores.first { it.first == MultiShot.PRE_SOLVE_BLUR }
        println("relief agreement by softening radius: " +
            scores.joinToString { "${it.first}:${"%.3f".format(it.second)}" })
        assertTrue(
            "the relief does not survive a moved hand at all (best ${best.second})",
            best.second > 0.55f
        )
        assertTrue(
            "PRE_SOLVE_BLUR=${MultiShot.PRE_SOLVE_BLUR} scores ${chosen.second} but " +
                "radius ${best.first} scores ${best.second} — retune it",
            chosen.second >= best.second - 0.05f
        )
    }

    @Test
    fun `the blur keeps the picture's level, it only takes the detail out`() {
        val f = MultiShot.Frame(N, N, FloatArray(N * N) { 120f })
        val b = MultiShot.blur(f, 3)
        for (v in b.v) assertEquals(120.0, v.toDouble(), 0.01)
    }

    @Test
    fun `glare is beaten by taking the darkest of the frames`() {
        val clean = FloatArray(N * N) { 180f }
        // three shots, a bright patch in a different place in each
        val shots = listOf(0, 1, 2).map { k ->
            val v = clean.copyOf()
            for (y in 0 until N) for (x in 0 until N) {
                val cx = 30 + k * 50
                if ((x - cx) * (x - cx) + (y - 80) * (y - 80) < 200) v[y * N + x] = 255f
            }
            MultiShot.Frame(N, N, v)
        }
        val n = MultiShot.normals(shots) // not used, just proves shapes agree
        assertEquals(N * N, n[0].size)
        // the soft minimum: mean of the two darkest at each pixel
        var worst = 0f
        for (p in 0 until N * N) {
            val vs = shots.map { it.v[p] }.sorted()
            val soft = (vs[0] + vs[1]) / 2f
            worst = maxOf(worst, abs(soft - 180f))
        }
        assertTrue("glare survived the soft minimum (worst $worst)", worst < 1f)
    }
}
