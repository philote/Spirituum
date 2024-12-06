@file:OptIn(ExperimentalMaterial3Api::class)

package com.josephhopson.spirituum.ui.recipe

import androidx.annotation.StringRes
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.WindowInsets
import androidx.compose.foundation.layout.asPaddingValues
import androidx.compose.foundation.layout.calculateEndPadding
import androidx.compose.foundation.layout.calculateStartPadding
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.safeDrawing
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Edit
import androidx.compose.material3.AlertDialog
import androidx.compose.material3.Button
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.FloatingActionButton
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalLayoutDirection
import androidx.compose.ui.res.dimensionResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.lifecycle.viewmodel.compose.viewModel
import com.josephhopson.spirituum.R
import com.josephhopson.spirituum.SpirituumTopAppBar
import com.josephhopson.spirituum.data.Recipe
import com.josephhopson.spirituum.ui.AppViewModelProvider
import com.josephhopson.spirituum.ui.navigation.NavigationDestination
import com.josephhopson.spirituum.ui.theme.SpirituumTheme
import kotlinx.coroutines.launch

object RecipeDetailsDestination : NavigationDestination {
    override val route = "recipe_details"
    override val titleRes = R.string.recipe_detail_title
    const val RECIPE_ID_ARG = "recipeId"
    val routeWithArgs = "$route/{$RECIPE_ID_ARG}"
}

@Composable
fun RecipeDetailScreen(
    navigateToEditItem: (Long) -> Unit,
    navigateBack: () -> Unit,
    modifier: Modifier = Modifier,
    viewModel: RecipeDetailsViewModel = viewModel(factory = AppViewModelProvider.Factory)
) {
    val uiState = viewModel.uiState.collectAsState()
    val coroutineScope = rememberCoroutineScope()
    Scaffold(
        topBar = {
            SpirituumTopAppBar(
                title = "",
                canNavigateBack = true,
                navigateUp = navigateBack
            )
        },
        floatingActionButton = {
            FloatingActionButton(
                onClick = { navigateToEditItem(uiState.value.recipeDetails.id) },
                shape = MaterialTheme.shapes.medium,
                modifier = Modifier
                    .padding(
                        end = WindowInsets.safeDrawing.asPaddingValues()
                            .calculateEndPadding(LocalLayoutDirection.current)
                    )
            ) {
                Icon(
                    imageVector = Icons.Default.Edit,
                    contentDescription = stringResource(R.string.edit_recipe_title),
                )
            }
        },
        modifier = modifier,
    ) { innerPadding ->
        RecipeDetailsBody(
            recipeDetailsUiState = uiState.value,
            onDelete = {
                // TODO: figure this out, make better
                // Note: If the user rotates the screen very fast, the operation may get cancelled
                // and the item may not be deleted from the Database. This is because when config
                // change occurs, the Activity will be recreated and the rememberCoroutineScope will
                // be cancelled - since the scope is bound to composition.
                coroutineScope.launch {
                    viewModel.deleteRecipe()
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
        )
    }
}

@Composable
private fun RecipeDetailsBody(
    recipeDetailsUiState: RecipeDetailsUiState,
    onDelete: () -> Unit,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier.padding(dimensionResource(R.dimen.padding_medium)),
        verticalArrangement = Arrangement.spacedBy(dimensionResource(R.dimen.padding_medium))
    ) {
        var deleteConfirmationRequired by rememberSaveable { mutableStateOf(false) }
        RecipeDetailsView(
            recipe = recipeDetailsUiState.recipeDetails.toRecipe(),
            modifier = Modifier.fillMaxWidth()
        )
        Button(
            onClick = { deleteConfirmationRequired = true },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text(stringResource(R.string.delete))
        }
        if (deleteConfirmationRequired) {
            DeleteConfirmationDialog(
                onDeleteConfirm = {
                    deleteConfirmationRequired = false
                    onDelete()
                },
                onDeleteCancel = { deleteConfirmationRequired = false },
                modifier = Modifier.padding(dimensionResource(R.dimen.padding_medium))
            )
        }
    }
}

@Composable
fun RecipeDetailsView(
    recipe: Recipe,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier,
        colors = CardDefaults.cardColors()
    ) {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(dimensionResource(R.dimen.padding_medium)),
            verticalArrangement = Arrangement.spacedBy(dimensionResource(R.dimen.padding_medium))
        ) {
            RecipeDetailsRow(
                labelResID = R.string.label_recipe_name,
                recipeDetail = recipe.name
            )
            RecipeDetailsColumn(
                labelResID = R.string.label_recipe_about,
                recipeDetail = recipe.about
            )
            RecipeDetailsColumn(
                labelResID = R.string.label_recipe_notes,
                recipeDetail = recipe.notes
            )
        }
    }
}

@Composable
private fun RecipeDetailsRow(
    @StringRes labelResID: Int,
    recipeDetail: String,
    modifier: Modifier = Modifier.padding(
        horizontal = dimensionResource(R.dimen.padding_medium)
    )
) {
    Row(modifier = modifier) {
        Text(
            text = stringResource(labelResID) + ":",
            fontWeight = FontWeight.Bold,
            modifier = Modifier.padding(
                PaddingValues(end = dimensionResource(R.dimen.padding_small))
            )
        )
        Text(text = recipeDetail)
    }
}

@Composable
private fun RecipeDetailsColumn(
    @StringRes labelResID: Int,
    recipeDetail: String,
    modifier: Modifier = Modifier.padding(
        horizontal = dimensionResource(R.dimen.padding_medium)
    )
) {
    Column(modifier = modifier) {
        Text(
            text = stringResource(labelResID),
            fontWeight = FontWeight.Bold,
            modifier = Modifier.padding(
                PaddingValues(bottom = dimensionResource(R.dimen.padding_small))
            )
        )
        Text(text = recipeDetail)
    }
}

@Composable
private fun DeleteConfirmationDialog(
    onDeleteConfirm: () -> Unit,
    onDeleteCancel: () -> Unit,
    modifier: Modifier = Modifier
) {
    AlertDialog(
        onDismissRequest = { /* Do nothing */ },
        title = { Text(stringResource(R.string.attention)) },
        text = { Text(stringResource(R.string.delete_question)) },
        modifier = modifier,
        dismissButton = {
            TextButton(onClick = onDeleteCancel) {
                Text(text = stringResource(R.string.no))
            }
        },
        confirmButton = {
            TextButton(onClick = onDeleteConfirm) {
                Text(text = stringResource(R.string.yes))
            }
        }
    )
}

@Preview(showBackground = true)
@Composable
fun DeleteConfirmationDialogPreview() {
    SpirituumTheme {
        DeleteConfirmationDialog(
            onDeleteConfirm = {},
            onDeleteCancel = {}
        )
    }
}

@Preview(showBackground = true)
@Composable
fun RecipeDetailsScreenPreview() {
    SpirituumTheme {
        RecipeDetailsBody(
            RecipeDetailsUiState(
                recipeDetails = Recipe(
                    name = "Zombie",
                    about = "Adapted from Donn Beach’s Zombie, created in 1934, Martin Cate’s version of the classic tiki cocktail hews close to tradition. A potent mix of rum, citrus and sweetener, the original drink was shrouded in myth about its madness-inducing properties, including menu warnings about a two-per-person limit imposed “for your own safety.” Today, it’s no wonder that Cate advises to garnish “with a mint sprig and a healthy dose of trepidation.”",
                    recipeId = 1,
                    image = "",
                    instructions = "",
                    notes = "",
                    alcoholic = true,
                    glassware = "highball",
                    garnish = "mint sprig",
                ).toRecipeDetails(),
            ),
            onDelete = {}
        )
    }
}
