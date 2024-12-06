@file:OptIn(ExperimentalMaterial3Api::class)

package com.josephhopson.spirituum.ui.recipe

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.calculateEndPadding
import androidx.compose.foundation.layout.calculateStartPadding
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.Button
import androidx.compose.material3.Card
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalLayoutDirection
import androidx.compose.ui.res.dimensionResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.lifecycle.viewmodel.compose.viewModel
import com.josephhopson.spirituum.R
import com.josephhopson.spirituum.SpirituumTopAppBar
import com.josephhopson.spirituum.ui.AppViewModelProvider
import com.josephhopson.spirituum.ui.navigation.NavigationDestination
import com.josephhopson.spirituum.ui.theme.SpirituumTheme
import kotlinx.coroutines.launch

object RecipeEntryDestination : NavigationDestination {
    override val route = "recipe_entry"
    override val titleRes = R.string.recipe_entry_title
}

@Composable
fun RecipeEntryScreen(
    navigateBack: () -> Unit,
    onNavigateUp: () -> Unit,
    canNavigateBack: Boolean = true,
    viewModel: RecipeEntryViewModel = viewModel(factory = AppViewModelProvider.Factory)
) {
    val coroutineScope = rememberCoroutineScope()
    Scaffold(
        topBar = {
            SpirituumTopAppBar(
                title = stringResource(RecipeEntryDestination.titleRes),
                canNavigateBack = canNavigateBack,
                navigateUp = onNavigateUp
            )
        }
    ) { innerPadding ->
        RecipeEntryBody(
            recipeUiState = viewModel.recipeUiState,
            onRecipeValueChange = viewModel::updateUiState,
            onSaveClick = {
                coroutineScope.launch {
                    viewModel.saveRecipe()
                    navigateBack()
                }
            },
            modifier = Modifier
                .padding(
                    start = innerPadding.calculateStartPadding(LocalLayoutDirection.current),
                    top = innerPadding.calculateTopPadding(),
                    end = innerPadding.calculateEndPadding(LocalLayoutDirection.current)
                )
                .verticalScroll(rememberScrollState())
                .fillMaxWidth()
        )
    }
}

@Composable
fun RecipeEntryBody(
    recipeUiState: RecipeUiState,
    onRecipeValueChange: (RecipeDetails) -> Unit,
    onSaveClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier.padding(dimensionResource(R.dimen.padding_medium)),
        verticalArrangement = Arrangement.spacedBy(dimensionResource(R.dimen.padding_large))
    ) {
        RecipeInputForm(
            recipeDetails = recipeUiState.recipeDetails,
            onValueChange = onRecipeValueChange,
            modifier = Modifier.fillMaxWidth()
        )
        Button(
            onClick = onSaveClick,
            enabled = recipeUiState.isEntryValid,
            modifier = Modifier.fillMaxWidth()
        ) {
            Text(text = stringResource(R.string.save_action))
        }
    }
}

@Composable
fun RecipeInputForm(
    recipeDetails: RecipeDetails,
    modifier: Modifier = Modifier,
    onValueChange: (RecipeDetails) -> Unit = {},
    enabled: Boolean = true
) {
    Column(
        modifier = modifier
            .fillMaxSize(),
        verticalArrangement = Arrangement.spacedBy(dimensionResource(R.dimen.padding_medium))
    ) {
        val largeTextModifier = Modifier
            .fillMaxWidth()
            .height(200.dp)
        OutlinedTextField(
            value = recipeDetails.name,
            onValueChange = { onValueChange(recipeDetails.copy(name = it)) },
            label = {
                Text(stringResource(R.string.label_recipe_name) + "*")
            },
            modifier = Modifier.fillMaxWidth(),
            enabled = enabled,
            singleLine = true
        )
        OutlinedTextField(
            value = recipeDetails.about,
            onValueChange = { onValueChange(recipeDetails.copy(about = it)) },
            label = {
                Text(stringResource(R.string.label_recipe_about))
            },
            modifier = largeTextModifier,
            enabled = enabled,
            singleLine = false,
        )
//        Ingredients(
//            recipeDetails = recipeDetails,
//            onValueChange = onValueChange,
//        )
        OutlinedTextField(
            value = recipeDetails.instructions,
            onValueChange = { onValueChange(recipeDetails.copy(instructions = it)) },
            label = {
                Text(stringResource(R.string.label_recipe_instructions))
            },
            modifier = largeTextModifier,
            enabled = enabled,
            singleLine = false,
        )
        OutlinedTextField(
            value = recipeDetails.garnish,
            onValueChange = { onValueChange(recipeDetails.copy(garnish = it)) },
            label = {
                Text(stringResource(R.string.label_recipe_garnish))
            },
            modifier = Modifier.fillMaxWidth(),
            enabled = enabled,
            singleLine = true
        )
        OutlinedTextField(
            value = recipeDetails.glassware,
            onValueChange = { onValueChange(recipeDetails.copy(glassware = it)) },
            label = {
                Text(stringResource(R.string.label_recipe_glassware))
            },
            modifier = Modifier.fillMaxWidth(),
            enabled = enabled,
            singleLine = true
        )

        OutlinedTextField(
            value = recipeDetails.notes,
            onValueChange = { onValueChange(recipeDetails.copy(notes = it)) },
            label = {
                Text(stringResource(R.string.label_recipe_notes))
            },
            modifier = largeTextModifier,
            enabled = enabled,
            singleLine = false,
        )
        if (enabled) {
            Text(
                text = stringResource(R.string.required_fields),
                modifier = Modifier.padding(start = dimensionResource(id = R.dimen.padding_medium)),
                fontSize = MaterialTheme.typography.labelLarge.fontSize
            )
        }
    }
}

@Composable
fun Ingredients(
    recipeDetails: RecipeDetails,
    onValueChange: (RecipeDetails) -> Unit = {},
    modifier: Modifier = Modifier
        .background(MaterialTheme.colorScheme.surfaceContainer),
) {
    Button(
        onClick = { /* TODO Add an ingredient */ },
        modifier = Modifier.fillMaxWidth()
    ) {
        Text(text = stringResource(R.string.add_ingredient))
    }
    recipeDetails.ingredients.forEach { ingredient ->
        IngredientView(
            ingredient,
            onValueChange = onValueChange
        )
    }
}

@Composable
fun IngredientView(
    ingredient: IngredientDetails,
    onValueChange: (RecipeDetails) -> Unit = {},
    modifier: Modifier = Modifier
) {
    Card(
        modifier = Modifier
            .padding(dimensionResource(R.dimen.padding_small))
            .fillMaxWidth(),
    ) {
        val padding = dimensionResource(R.dimen.padding_medium)
        OutlinedTextField(
            value = ingredient.name,
            onValueChange = { /*TODO somehow get the update to happen*/ },
            label = {
                Text(stringResource(R.string.label_ingredient_name) + "*")
            },
            modifier = Modifier.fillMaxWidth()
                .padding(padding),
            singleLine = true
        )
        OutlinedTextField(
            value = ingredient.amount,
            onValueChange = { /*TODO somehow get the update to happen*/ },
            label = {
                Text(stringResource(R.string.label_ingredient_amount))
            },
            modifier = Modifier.fillMaxWidth()
                .padding(padding),
            singleLine = true
        )
        OutlinedTextField(
            value = ingredient.notes,
            onValueChange = { /*TODO somehow get the update to happen*/ },
            label = {
                Text(stringResource(R.string.label_ingredient_notes))
            },
            modifier = Modifier
                .fillMaxWidth()
                .height(200.dp)
                .padding(padding),
            singleLine = false,
        )
    }
}

@Preview(showBackground = true)
@Composable
private fun ItemEntryScreenPreview() {
    SpirituumTheme {
        RecipeEntryBody(recipeUiState = RecipeUiState(
            RecipeDetails(
                name = "Recipe Name",
                about = "Recipe About",
                notes = "Recipe Notes",
                id = 1,
                alcoholic = true,
                glassware = "Rocks Glass",
                garnish = "Cherries",
                instructions = "Shake well",
                ingredients = listOf(
                    IngredientDetails(
                        id = 1,
                        name = "Ingredient",
                        amount = "20oz",
                        notes = "Notes!"
                    )
                )
            )
        ),
            onRecipeValueChange = {},
            onSaveClick = {}
        )
    }
}
