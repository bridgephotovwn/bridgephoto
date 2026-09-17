package app.bridgephoto

import android.content.Context
import java.io.File
import java.io.PrintWriter
import java.io.StringWriter
import java.util.Date

/**
 * Private, on-device crash record. The app has no internet and sends nothing;
 * the user decides whether to share the report (Home screen offers it after a crash).
 */
object CrashLog {
    private var installed = false
    private const val MAX_BYTES = 200_000L

    private fun file(ctx: Context) = File(ctx.filesDir, "crash.txt")

    fun install(ctx: Context) {
        if (installed) return
        installed = true
        val app = ctx.applicationContext
        val previous = Thread.getDefaultUncaughtExceptionHandler()
        Thread.setDefaultUncaughtExceptionHandler { thread, error ->
            try {
                val sw = StringWriter()
                error.printStackTrace(PrintWriter(sw))
                append(app, "thread=" + thread.name + "\n" + sw)
            } catch (_: Throwable) {
            }
            previous?.uncaughtException(thread, error)
        }
    }

    @Synchronized
    fun append(ctx: Context, text: String) {
        try {
            val f = file(ctx.applicationContext)
            if (f.exists() && f.length() > MAX_BYTES) f.delete()
            f.appendText(
                "=== " + Date() + "  BRIDGE PHOTO " + versionName(ctx) +
                    "  Android " + android.os.Build.VERSION.RELEASE + " " + android.os.Build.MODEL + "\n" +
                    text.trimEnd() + "\n\n"
            )
        } catch (_: Throwable) {
        }
    }

    /** Returns the report and forgets it. */
    @Synchronized
    fun take(ctx: Context): String? {
        val f = file(ctx.applicationContext)
        if (!f.exists()) return null
        val s = try { f.readText() } catch (_: Throwable) { null }
        f.delete()
        return s
    }

    private fun versionName(ctx: Context): String = try {
        ctx.packageManager.getPackageInfo(ctx.packageName, 0).versionName ?: "?"
    } catch (_: Throwable) {
        "?"
    }
}
