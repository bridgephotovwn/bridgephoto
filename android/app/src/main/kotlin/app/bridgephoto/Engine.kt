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
import android.provider.MediaStore
import com.google.android.gms.tasks.Tasks
import com.google.mlkit.vision.common.InputImage
import com.google.mlkit.vision.documentscanner.GmsDocumentScannerOptions
import com.google.mlkit.vision.documentscanner.GmsDocumentScanning
import com.google.mlkit.vision.documentscanner.GmsDocumentScanningResult
import com.google.mlkit.vision.text.TextRecognition
import com.google.mlkit.vision.text.TextRecognizer
import com.google.mlkit.vision.text.devanagari.DevanagariTextRecognizerOptions
import com.google.mlkit.vision.text.latin.TextRecognizerOptions
import com.tom_roush.pdfbox.android.PDFBoxResourceLoader
import com.tom_roush.pdfbox.io.MemoryUsageSetting
import com.tom_roush.pdfbox.multipdf.PDFMergerUtility
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.io.FileOutputStream
import kotlin.math.max
import kotlin.math.min

/**
 * The native engine behind the "bridgephoto/engine" channel.
 *  - scan:          Google ML Kit document scanner (Play services, on device)
 *  - ocr:           Google ML Kit text recognition (Latin / Devanagari, on device)
 *  - mergePdf:      PDFBox-Android, lossless
 *  - renderPdf:     android.graphics.pdf.PdfRenderer -> JPEG pages
 *  - transform:     rotate / re-encode an image
 *  - saveToGallery: MediaStore (Android 10+ only, no permission needed)
 */
class Engine(private val activity: Activity) : MethodChannel.MethodCallHandler {
    private val main = Handler(Looper.getMainLooper())
    private var pendingScan: MethodChannel.Result? = null

    /** Set by MainActivity so the engine can push events (recovered scans) to Dart. */
    var channel: MethodChannel? = null

    companion object {
        const val REQ_SCAN = 7101
    }

    init {
        PDFBoxResourceLoader.init(activity.applicationContext)
    }

    private val pendingDir: File get() = File(activity.cacheDir, "scan_pending")

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "scan" -> scan(call, result)
            "warmUp" -> result.success(warmUp())
            "takePendingScan" -> bg(result) { takePendingScan() }
            "ocr" -> bg(result) {
                ocr(call.argument<String>("path")!!, call.argument<String>("script") ?: "latin")
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

    private fun bg(result: MethodChannel.Result, work: () -> Any?) {
        Thread {
            try {
                val v = work()
                main.post { result.success(v) }
            } catch (e: Throwable) {
                // Tasks.await wraps the real failure in an ExecutionException.
                val c = (e as? java.util.concurrent.ExecutionException)?.cause ?: e
                main.post { result.error("engine", c.message ?: c.toString(), null) }
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

    /** True once the scanner activity has actually been launched for [pendingScan]. */
    private var scanLaunched = false
    private var scanToken = 0

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
        val old = pendingScan
        if (old != null) {
            if (scanLaunched) {
                // The previous scanner activity never reported back (it cannot
                // still be open: the user is tapping our button). Drop it.
                pendingScan = null
                old.success(emptyList<String>())
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
        pendingScan = result
        scanLaunched = false
        val token = ++scanToken
        channel?.invokeMethod("scanState", "preparing")

        // First use: Play services downloads the scanner module and the intent
        // task only completes afterwards. Do not wait forever.
        val timeout = Runnable {
            if (token == scanToken && pendingScan === result && !scanLaunched) {
                pendingScan = null
                channel?.invokeMethod("scanState", "closed")
                result.error(
                    "scanner",
                    "Google Play services is still downloading the scanner (this happens once). " +
                        "Please try again in a minute.",
                    null
                )
            }
        }
        main.postDelayed(timeout, 90_000)

        GmsDocumentScanning.getClient(options).getStartScanIntent(activity)
            .addOnSuccessListener { sender ->
                main.removeCallbacks(timeout)
                if (token != scanToken || pendingScan !== result) return@addOnSuccessListener
                try {
                    activity.startIntentSenderForResult(sender, REQ_SCAN, null, 0, 0, 0)
                    scanLaunched = true
                    channel?.invokeMethod("scanState", "open")
                } catch (e: Exception) {
                    pendingScan = null
                    channel?.invokeMethod("scanState", "closed")
                    result.error("scanner", e.message ?: "Could not open the scanner.", null)
                }
            }
            .addOnFailureListener { e ->
                main.removeCallbacks(timeout)
                if (token != scanToken || pendingScan !== result) return@addOnFailureListener
                pendingScan = null
                channel?.invokeMethod("scanState", "closed")
                result.error(
                    "scanner",
                    "Could not open the scanner. If this is the first use, Google Play services " +
                        "may still be downloading it: wait a minute and try again. (" +
                        (e.message ?: e.toString()) + ")",
                    null
                )
            }
    }

    /** Called by MainActivity. Returns true when the result was ours. */
    fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (requestCode != REQ_SCAN) return false
        val res = pendingScan
        pendingScan = null
        scanLaunched = false
        channel?.invokeMethod("scanState", "closed")
        if (resultCode != Activity.RESULT_OK || data == null) {
            res?.success(emptyList<String>())
            return true
        }
        val scan = GmsDocumentScanningResult.fromActivityResultIntent(data)
        val uris = scan?.pages?.map { it.imageUri } ?: emptyList()
        if (res != null) {
            bg(res) { copyPages(uris, File(activity.cacheDir, "scan")) }
        } else {
            // The activity was recreated while the scanner was open: nobody is
            // waiting. Park the pages and tell Dart when it is listening.
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

    private fun ocr(path: String, script: String): Map<String, Any> {
        val bounds = BitmapFactory.Options().apply { inJustDecodeBounds = true }
        BitmapFactory.decodeFile(path, bounds)
        val ow = bounds.outWidth
        val oh = bounds.outHeight
        if (ow <= 0 || oh <= 0) throw IllegalArgumentException("Cannot read the image.")
        var sample = 1
        while (max(ow, oh) / sample > 2400) sample *= 2
        val bmp = BitmapFactory.decodeFile(path, BitmapFactory.Options().apply { inSampleSize = sample })
            ?: throw IllegalArgumentException("Cannot decode the image.")
        val sx = ow.toDouble() / bmp.width
        val sy = oh.toDouble() / bmp.height
        val recognizer: TextRecognizer = if (script == "devanagari") {
            TextRecognition.getClient(DevanagariTextRecognizerOptions.Builder().build())
        } else {
            TextRecognition.getClient(TextRecognizerOptions.DEFAULT_OPTIONS)
        }
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
            return mapOf("w" to ow, "h" to oh, "lines" to lines)
        } finally {
            recognizer.close()
            bmp.recycle()
        }
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
