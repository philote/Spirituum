package com.josephhopson.spirituum

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.Surface
import androidx.compose.ui.Modifier
import com.josephhopson.spirituum.ui.theme.SpirituumTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        enableEdgeToEdge()
        super.onCreate(savedInstanceState)
        setContent {
            SpirituumApp()
        }
        setContent {
            SpirituumTheme {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                ) {
                    SpirituumApp()
                }
            }
        }
    }
}