package com.josephhopson.spirituum.ui.home

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.josephhopson.spirituum.data.RecipesRepository
import com.josephhopson.spirituum.ui.recipe.RecipeDetails
import com.josephhopson.spirituum.ui.recipe.toRecipeDetails
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.filterNotNull
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.flow.stateIn

class HomeViewModel(recipesRepository: RecipesRepository) : ViewModel() {

    /**
     * Home ui state: Initialize by getting all the recipes and converting them to UI objects
     */
    val homeUiState: StateFlow<HomeUiState> =
        recipesRepository.getAllRecipesStream()
            .filterNotNull()
            .map { recipes ->
                HomeUiState(
                    recipes.map { recipe ->
                        recipe.toRecipeDetails()
                    }
                )
            }
            .stateIn(
                scope = viewModelScope,
                started = SharingStarted.WhileSubscribed(TIMEOUT_MILLIS),
                initialValue = HomeUiState()
            )

    companion object {
        private const val TIMEOUT_MILLIS = 5_000L
    }
}

/**
 * Home ui state
 *
 * @property recipes
 */
data class HomeUiState(val recipes: List<RecipeDetails> = listOf())

//    private suspend fun getRecipeDataFromRepo(): HomeUiState {
////        val recipesRepository = OfflineRecipesRepository()
//        return HomeUiState.Success(
//            listOf(
//                Recipe(
//                    name = "Zombie",
//                    about = "Adapted from Donn Beach’s Zombie, created in 1934, Martin Cate’s version of the classic tiki cocktail hews close to tradition. A potent mix of rum, citrus and sweetener, the original drink was shrouded in myth about its madness-inducing properties, including menu warnings about a two-per-person limit imposed “for your own safety.” Today, it’s no wonder that Cate advises to garnish “with a mint sprig and a healthy dose of trepidation.”",
//                    id = 1,
//                    altName = "Zombie Alt",
//                    type = "",
//                    categories = "",
//                    image = "",
//                    instructions = "",
//                    tags = "",
//                    notes = "",
//                    alcoholic = true,
//                    glassware = "highball",
//                    garnish = "mint sprig",
//                    ingredients = ""
//                ),
//                Recipe(
//                    name = "Classic Old Fashioned",
//                    about = "The old fashioned is a classic cocktail that was invented in Louisville, KY. You can make it with bourbon, rye, or a blended whiskey. You can also substitute one sugar cube for the simple syrup.",
//                    id = 2,
//                    altName = "Old Fashioned Alt",
//                    type = "",
//                    categories = "",
//                    image = "",
//                    instructions = "",
//                    tags = "",
//                    notes = "",
//                    alcoholic = true,
//                    glassware = "whiskey glass",
//                    garnish = "orange slice and maraschino cherry",
//                    ingredients = ""
//                )
//            )
//        )
//    }
//}