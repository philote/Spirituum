package com.josephhopson.spirituum.ui.recipe

import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.SavedStateHandle
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.josephhopson.spirituum.data.RecipesRepository
import kotlinx.coroutines.flow.filterNotNull
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.launch

/**
 * Recipe edit ViewModel, to retrieve and update a recipe from the
 * [RecipesRepository]'s data source
 *
 * @property recipesRepository Injected with DI
 * @param savedStateHandle used to pass the recipe ID from origin to this screen
 */
class RecipeEditViewModel(
    savedStateHandle: SavedStateHandle,
    private val recipesRepository: RecipesRepository
) : ViewModel() {

    /**
     * Holds the current Recipe ui state
     */
    var recipeUiState by mutableStateOf(RecipeUiState())
        private set

    private val recipeId: Long = checkNotNull(savedStateHandle[RecipeEditDestination.RECIPE_ID_ARG])

    init {
        viewModelScope.launch {
            recipeUiState = recipesRepository.getRecipeStream(recipeId)
                .filterNotNull()
                .first()
                .toRecipeUiState(true)
        }
    }

    /**
     * Update the recipe in the [RecipesRepository]'s data source
     */
    suspend fun updateRecipe() {
        if (validateInput(recipeUiState.recipeDetails)) {
            recipesRepository.updateRecipe(recipeUiState.recipeDetails.toRecipe())
        }
    }

    /**
     * Update [RecipeUiState] with the provided [RecipeDetails] after validation
     *
     * @param recipeDetails
     */
    fun updateUiState(recipeDetails: RecipeDetails) {
        recipeUiState = RecipeUiState(
            recipeDetails = recipeDetails,
            isEntryValid = validateInput(recipeDetails)
        )
    }

    /**
     * Validates the user input of a [RecipeDetails]
     *
     * @param uiState [RecipeDetails] to be validated
     * @return true if the data is valid
     */
    private fun validateInput(uiState: RecipeDetails = recipeUiState.recipeDetails): Boolean {
        return with(uiState) {
            name.isNotBlank()
        }
    }
}