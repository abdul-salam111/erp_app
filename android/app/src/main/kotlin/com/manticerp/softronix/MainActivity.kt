package com.manticerp.softronix

import android.net.Uri
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.io.FileOutputStream

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.manticerp.softronix/content_resolver"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "copyContentUriToFile" -> {
                        val uris = call.argument<List<String>>("uris")
                        if (uris == null) {
                            result.error("INVALID_ARGS", "uris argument is required", null)
                            return@setMethodCallHandler
                        }
                        try {
                            val filePaths = uris.mapIndexed { index, uriString ->
                                val uri = Uri.parse(uriString)
                                val outFile = File(
                                    cacheDir,
                                    "scan_${System.currentTimeMillis()}_$index.jpg"
                                )
                                contentResolver.openInputStream(uri)?.use { input ->
                                    FileOutputStream(outFile).use { output ->
                                        input.copyTo(output)
                                    }
                                }
                                outFile.absolutePath
                            }
                            result.success(filePaths)
                        } catch (e: Exception) {
                            result.error("COPY_FAILED", e.message, null)
                        }
                    }
                    else -> result.notImplemented()
                }
            }
    }
}
