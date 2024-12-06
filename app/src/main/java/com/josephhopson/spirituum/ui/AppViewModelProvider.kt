package com.josephhopson.spirituum.ui

import android.app.Application
import androidx.lifecycle.ViewModelProvider.AndroidViewModelFactory
import androidx.lifecycle.createSavedStateHandle
import androidx.lifecycle.viewmodel.CreationExtras
import androidx.lifecycle.viewmodel.initializer
import androidx.lifecycle.viewmodel.viewModelFactory
import com.josephhopson.spirituum.SpiritummApplication
import com.josephhopson.spirituum.ui.home.HomeViewModel
import com.josephhopson.spirituum.ui.recipe.RecipeDetailsViewModel
import com.josephhopson.spirituum.ui.recipe.RecipeEditViewModel
import com.josephhopson.spirituum.ui.recipe.RecipeEntryViewModel

object AppViewModelProvider {
    val Factory = viewModelFactory {
        // Initializer for RecipeEditViewModel
        initializer {
            RecipeEditViewModel(
                this.createSavedStateHandle(),
                spirituumApplication().container.recipesRepository
            )
        }
        // Initializer for RecipeEntryViewModel
        initializer {
            RecipeEntryViewModel(
                spirituumApplication().container.recipesRepository
            )
        }
        // Initializer for RecipeDetailsViewModel
        initializer {
            RecipeDetailsViewModel(
                this.createSavedStateHandle(),
                spirituumApplication().container.recipesRepository
            )
        }
        // Initializer for HomeViewModel
        initializer {
            HomeViewModel(spirituumApplication().container.recipesRepository)
        }
    }
}

/**
 * Extension function to queries for [Application] object and returns an instance of
 * [SpiritummApplication].
 */
fun CreationExtras.spirituumApplication(): SpiritummApplication =
    (this[AndroidViewModelFactory.APPLICATION_KEY] as SpiritummApplication)