package com.josephhopson.spirituum.ui.recipe

import androidx.lifecycle.SavedStateHandle
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.josephhopson.spirituum.data.RecipesRepository
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.filterNotNull
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.flow.stateIn

/**
 * Recipe detail ViewModel, to retrieve and delete a recipe from the
 * [RecipesRepository]'s data source
 *
 * @property recipesRepository Injected with DI
 * @param savedStateHandle used to pass the recipe ID from origin to this screen
 */
class RecipeDetailsViewModel(
    savedStateHandle: SavedStateHandle,
    private val recipesRepository: RecipesRepository
) : ViewModel() {
    private val recipeId: Long =
        checkNotNull(savedStateHandle[RecipeDetailsDestination.RECIPE_ID_ARG])

    /**
     * Holds the recipe details ui state. The data is retrieved from [RecipesRepository]
     * and mapped to the UI state.
     */
    val uiState: StateFlow<RecipeDetailsUiState> =
        recipesRepository.getRecipeStream(recipeId)
            .filterNotNull()
            .map {
                RecipeDetailsUiState(recipeDetails = it.toRecipeDetails())
            }.stateIn(
                scope = viewModelScope,
                started = SharingStarted.WhileSubscribed(TIMEOUT_MILLIS),
                initialValue = RecipeDetailsUiState()
            )

    /**
     * Deletes the recipe from the [RecipesRepository]'s data source.
     */
    suspend fun deleteRecipe() {
        recipesRepository.deleteRecipe(uiState.value.recipeDetails.toRecipe())
    }

    companion object {
        private const val TIMEOUT_MILLIS = 5_000L
    }
}

/**
 * UI state for RecipeDetailsScreen
 */
data class RecipeDetailsUiState(
    val recipeDetails: RecipeDetails = RecipeDetails()
)
