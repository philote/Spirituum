package com.josephhopson.spirituum.ui.home

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.WindowInsets
import androidx.compose.foundation.layout.asPaddingValues
import androidx.compose.foundation.layout.calculateEndPadding
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.safeDrawing
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material.icons.rounded.Notifications
import androidx.compose.material3.Card
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.FloatingActionButton
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBarDefaults.enterAlwaysScrollBehavior
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.input.nestedscroll.nestedScroll
import androidx.compose.ui.platform.LocalLayoutDirection
import androidx.compose.ui.res.dimensionResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.lifecycle.viewmodel.compose.viewModel
import com.josephhopson.spirituum.R
import com.josephhopson.spirituum.SpirituumTopAppBar
import com.josephhopson.spirituum.ui.AppViewModelProvider
import com.josephhopson.spirituum.ui.navigation.NavigationDestination
import com.josephhopson.spirituum.ui.recipe.RecipeDetails
import com.josephhopson.spirituum.ui.theme.SpirituumTheme

object HomeDestination : NavigationDestination {
    override val route = "home"
    override val titleRes = R.string.app_name
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun HomeScreen(
    navigateToItemEntry: () -> Unit,
    navigateToItemUpdate: (Long) -> Unit,
    modifier: Modifier = Modifier,
    viewModel: HomeViewModel = viewModel(factory = AppViewModelProvider.Factory)
) {
    val homeUiState by viewModel.homeUiState.collectAsState()
    val scrollBehavior = enterAlwaysScrollBehavior()

    Scaffold(
        modifier = modifier.nestedScroll(scrollBehavior.nestedScrollConnection),
        topBar = {
            SpirituumTopAppBar(
                title = stringResource(HomeDestination.titleRes),
                canNavigateBack = false,
                scrollBehavior = scrollBehavior
            )
        },
        floatingActionButton = {
            FloatingActionButton(
                onClick = navigateToItemEntry,
                modifier = Modifier
                    .padding(
                        end = WindowInsets.safeDrawing.asPaddingValues()
                            .calculateEndPadding(LocalLayoutDirection.current)
                    )
            ) {
                Icon(
                    imageVector = Icons.Default.Add,
                    contentDescription = stringResource(R.string.recipe_entry_title)
                )
            }
        }
    ) { innerPadding ->
        HomeBody(
            recipes = homeUiState.recipes,
            onItemClick = navigateToItemUpdate,
            modifier = modifier.fillMaxSize(),
            contentPadding = innerPadding
        )
    }
}

@Composable
fun HomeBody(
    recipes: List<RecipeDetails>,
    onItemClick: (Long) -> Unit,
    modifier: Modifier = Modifier,
    contentPadding: PaddingValues = PaddingValues(0.dp),
) {
    Column(
        horizontalAlignment = Alignment.CenterHorizontally,
        modifier = modifier
    ) {
        if (recipes.isEmpty()) {
            NoRecipes()
        } else {
            RecipeList(
                recipes = recipes,
                onItemClick = { onItemClick(it.id) },
                contentPadding = contentPadding,
                modifier = Modifier.padding(horizontal = dimensionResource(R.dimen.padding_small))
            )
        }
    }
}

@Composable
fun RecipeList(
    recipes: List<RecipeDetails>,
    onItemClick: (RecipeDetails) -> Unit,
    contentPadding: PaddingValues,
    modifier: Modifier = Modifier
) {
    LazyColumn(
        modifier = modifier,
        contentPadding = contentPadding
    ) {
        items(items = recipes, key = { it.id }) { recipe ->
            RecipeItem(
                recipe = recipe,
                modifier = Modifier
                    .padding(dimensionResource(R.dimen.padding_small))
                    .clickable { onItemClick(recipe) }
            )
        }
    }
}

@Composable
fun RecipeItem(
    recipe: RecipeDetails,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier.fillMaxWidth(),
    ) {
        Column(
            modifier = Modifier
                .padding(dimensionResource(R.dimen.padding_large)),
            verticalArrangement = Arrangement.spacedBy(dimensionResource(R.dimen.padding_small))
        ) {
            Text(
                text = recipe.name,
                style = MaterialTheme.typography.titleLarge
            )
            Text(
                text = stringResource(R.string.label_recipe_about),
                style = MaterialTheme.typography.titleMedium
            )
            Text(
                text = recipe.about,
                maxLines = 2,
                overflow = TextOverflow.Ellipsis

            )
//            Text(
//                text = stringResource(R.string.label_recipe_notes),
//                style = MaterialTheme.typography.titleMedium
//            )
//            Text(
//                text = recipe.notes
//            )
        }
    }
}

@Composable
fun NoRecipes() {
    Column(
        modifier = Modifier.fillMaxSize(),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Icon(
            Icons.Rounded.Notifications,
            contentDescription = stringResource(id = R.string.con_desc_no_recipes_icon)
        )
        Text(
            text = stringResource(R.string.no_item_description),
            textAlign = TextAlign.Center,
            modifier = Modifier
                .padding(16.dp),
            style = MaterialTheme.typography.headlineSmall,
//            color = MaterialTheme.colorScheme.primary
        )
    }
}

@Preview(showBackground = true)
@Composable
fun RecipeRecipeItemPreview() {
    SpirituumTheme {
        RecipeItem(
            RecipeDetails(
                name = "Zombie",
                about = "Adapted from Donn Beach’s Zombie, created in 1934, Martin Cate’s version of the classic tiki cocktail hews close to tradition. A potent mix of rum, citrus and sweetener, the original drink was shrouded in myth about its madness-inducing properties, including menu warnings about a two-per-person limit imposed “for your own safety.” Today, it’s no wonder that Cate advises to garnish “with a mint sprig and a healthy dose of trepidation.”",
                id = 1,
                notes = "",
                alcoholic = true,
                glassware = "highball",
                garnish = "mint sprig",
            ),
        )
    }
}

@Preview(apiLevel = 33, showBackground = true, showSystemUi = true)
@Composable
fun NoRecipesPreview() {
    SpirituumTheme {
        NoRecipes()
    }
}
