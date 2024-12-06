package com.josephhopson.spirituum.ui.navigation

import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.navigation.NavHostController
import androidx.navigation.NavType
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.navArgument
import com.josephhopson.spirituum.ui.home.HomeDestination
import com.josephhopson.spirituum.ui.home.HomeScreen
import com.josephhopson.spirituum.ui.recipe.RecipeDetailsDestination
import com.josephhopson.spirituum.ui.recipe.RecipeDetailScreen
import com.josephhopson.spirituum.ui.recipe.RecipeEditDestination
import com.josephhopson.spirituum.ui.recipe.RecipeEditScreen
import com.josephhopson.spirituum.ui.recipe.RecipeEntryDestination
import com.josephhopson.spirituum.ui.recipe.RecipeEntryScreen

/**
 * Provides Navigation graph for the application.
 */
@Composable
fun SpirituumNavHost(
    navController: NavHostController,
    modifier: Modifier = Modifier,
) {
    NavHost(
        navController = navController,
        startDestination = HomeDestination.route,
        modifier = modifier
    ) {
        composable(route = HomeDestination.route) {
            HomeScreen(
                navigateToItemEntry = { navController.navigate(RecipeEntryDestination.route) },
                navigateToItemUpdate = {
                    navController.navigate("${RecipeDetailsDestination.route}/${it}")
                }
            )
        }
        composable(route = RecipeEntryDestination.route) {
            RecipeEntryScreen(
                navigateBack = { navController.popBackStack() },
                onNavigateUp = { navController.navigateUp() }
            )
        }
        composable(
            route = RecipeDetailsDestination.routeWithArgs,
            arguments = listOf(navArgument(RecipeDetailsDestination.RECIPE_ID_ARG) {
                type = NavType.IntType
            })
        ) {
            RecipeDetailScreen(
                navigateToEditItem = { navController.navigate("${RecipeEditDestination.route}/$it") },
                navigateBack = { navController.navigateUp() }
            )
        }
        composable(
            route = RecipeEditDestination.routeWithArgs,
            arguments = listOf(navArgument(RecipeEditDestination.RECIPE_ID_ARG) {
                type = NavType.IntType
            })
        ) {
            RecipeEditScreen(
                navigateBack = { navController.popBackStack() },
                onNavigateUp = { navController.navigateUp() }
            )
        }
    }
}