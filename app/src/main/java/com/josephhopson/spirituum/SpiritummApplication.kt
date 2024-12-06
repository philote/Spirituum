package com.josephhopson.spirituum

import android.app.Application
import com.josephhopson.spirituum.data.AppContainer
import com.josephhopson.spirituum.data.AppDataContainer

class SpiritummApplication : Application() {

    /**
     * AppContainer instance used by the rest of classes to obtain dependencies
     */
    lateinit var container: AppContainer

    override fun onCreate() {
        super.onCreate()
        container = AppDataContainer(this)
    }
}