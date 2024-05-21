package com.delicious.food_for_you

import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import android.os.Bundle;
import io.flutter.embedding.engine.FlutterEngine;

class MainActivity: FlutterActivity() {

   override fun onCreate(savedInstanceState: Bundle?) {
        setTheme(R.style.NormalTheme) // Установите тему NormalTheme
        super.onCreate(savedInstanceState)
    }

   override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }
}
