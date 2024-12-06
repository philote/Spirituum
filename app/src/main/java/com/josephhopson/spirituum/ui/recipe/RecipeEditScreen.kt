package com.josephhopson.spirituum.ui.recipe

import androidx.compose.foundation.layout.calculateEndPadding
import androidx.compose.foundation.layout.calculateStartPadding
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Scaffold
import androidx.compose.runtime.Composable
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalLayoutDirection
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.lifecycle.viewmodel.compose.viewModel
import com.josephhopson.spirituum.R
import com.josephhopson.spirituum.SpirituumTopAppBar
import com.josephhopson.spirituum.ui.AppViewModelProvider
import com.josephhopson.spirituum.ui.navigation.NavigationDestination
import com.josephhopson.spirituum.ui.theme.SpirituumTheme
import kotlinx.coroutines.launch

object RecipeEditDestination : NavigationDestination {
    override val route = "recipe_edit"
    override val titleRes = R.string.edit_recipe_title
    const val RECIPE_ID_ARG = "recipeId"
    val routeWithArgs = "$route/{$RECIPE_ID_ARG}"
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun RecipeEditScreen(
    navigateBack: () -> Unit,
    onNavigateUp: () -> Unit,
    modifier: Modifier = Modifier,
    viewModel: RecipeEditViewModel = viewModel(factory = AppViewModelProvider.Factory)
) {
    val coroutineScope = rememberCoroutineScope()
    Scaffold(
        topBar = {
            SpirituumTopAppBar(
                title = stringResource(RecipeEditDestination.titleRes),
                canNavigateBack = true,
                navigateUp = onNavigateUp
            )
        },
        modifier = modifier
    ) { innerPadding ->
        RecipeEntryBody(
            recipeUiState = viewModel.recipeUiState,
            onRecipeValueChange = viewModel::updateUiState,
            onSaveClick = {
                coroutineScope.launch {
                    viewModel.updateRecipe()
                    navigateBack()
                }
            },
            modifier = Modifier
                .padding(
                    start = innerPadding.calculateStartPadding(LocalLayoutDirection.current),
                    top = innerPadding.calculateTopPadding(),
                    end = innerPadding.calculateEndPadding(LocalLayoutDirection.current),
                )
                .verticalScroll(rememberScrollState())
        )
    }
}

@Preview(showBackground = true)
@Composable
fun ItemEditScreenPreview() {
    SpirituumTheme {
        RecipeEditScreen(
            navigateBack = { /*Do nothing*/ },
            onNavigateUp = { /*Do nothing*/ }
        )
    }
}