package com.example.demo

import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger,"testflutter")
            .setMethodCallHandler(
                    MethodChannel.MethodCallHandler { call, result ->
                        run {
//                            Log.d("From Android: ", result.toString());
                            
                        }
                    }
            )
    }
}
