package com.josephhopson.spirituum.ui.recipe

import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import com.josephhopson.spirituum.data.Recipe
import com.josephhopson.spirituum.data.RecipesRepository

/**
 * ViewModel to validate and insert recipes into the Room DB
 *
 * @property recipesRepository DI injected repo
 */
class RecipeEntryViewModel(private val recipesRepository: RecipesRepository) : ViewModel() {

    /**
     * Holds the current Recipe ui state
     */
    var recipeUiState by mutableStateOf(RecipeUiState())
        private set

    /**
     * Updates the [RecipeUiState] with the given [RecipeDetails] after it is validated
     *
     * @param recipeDetails a UI [RecipeDetails] object
     */
    fun updateUiState(recipeDetails: RecipeDetails) {
        recipeUiState = RecipeUiState(
            recipeDetails = recipeDetails,
            isEntryValid = validateInput(recipeDetails)
        )
    }

    /**
     * Inserts a [Recipe] into the Room database
     */
    suspend fun saveRecipe() {
        if (validateInput()) {
            recipesRepository.insertRecipe(recipeUiState.recipeDetails.toRecipe())
        }
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
            // TODO add more validation
        }
    }
}

/**
 * UI state for a recipe
 *
 * @property recipeDetails Ui recipe object
 * @property isEntryValid validation result
 */
data class RecipeUiState(
    val recipeDetails: RecipeDetails = RecipeDetails(),
    val isEntryValid: Boolean = false
)

/**
 * A UI friendly version of a [Recipe]
 *
 * @property id
 * @property name
 * @property about
 * @property alcoholic
 * @property glassware
 * @property garnish
 * @property notes
 * @property instructions
 * @property ingredients
 */
data class RecipeDetails(
    val id: Long = 0,
    val name: String = "",
    val about: String = "",
    val alcoholic: Boolean = true,
    val glassware: String = "",
    val garnish: String = "",
    val notes: String = "",
    val instructions: String = "",
    val ingredients: List<IngredientDetails> = emptyList(),
)

data class IngredientDetails(
    val id: Long = 0,
    val name: String,
    val amount: String,
    val notes: String
)

/**
 * Extension function to convert the UI [RecipeDetails] to a repo [Recipe]
 */
fun RecipeDetails.toRecipe(): Recipe = Recipe(
    recipeId = id,
    name = name,
    about = about,
    alcoholic = alcoholic,
    glassware = glassware,
    garnish = garnish,
    notes = notes,
    image = "",
    instructions = instructions,
)

/**
 * Extension function to convert the repo [Recipe] to a [RecipeUiState]
 */
fun Recipe.toRecipeUiState(isEntryValid: Boolean = false): RecipeUiState = RecipeUiState(
    recipeDetails = this.toRecipeDetails(),
    isEntryValid = isEntryValid
)

/**
 * Extension function to convert the repo [Recipe] to a UI [RecipeDetails]
 */
fun Recipe.toRecipeDetails(): RecipeDetails = RecipeDetails(
    id = recipeId,
    name = name,
    about = about,
    alcoholic = alcoholic,
    glassware = glassware,
    garnish = garnish,
    notes = notes,
    ingredients = emptyList(), //TODO get the actual ingredients from the repo
)