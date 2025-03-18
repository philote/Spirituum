import 'package:spirituum/domain/models/recipe.dart' as domain;

/// Interface for local data source operations
/// 
/// This interface defines methods to interact with the local storage
/// for recipe data.
abstract class RecipeLocalDataSource {
  /// Gets all recipes from local storage
  Future<List<domain.Recipe>> getAllRecipes();
  
  /// Gets a recipe by its ID from local storage
  Future<domain.Recipe?> getRecipeById(String id);
  
  /// Saves a recipe to local storage
  Future<domain.Recipe> saveRecipe(domain.Recipe recipe);
  
  /// Deletes a recipe from local storage
  Future<void> deleteRecipe(String id);
  
  /// Gets all favorite recipes from local storage
  Future<List<domain.Recipe>> getFavoriteRecipes();
  
  /// Sets a recipe's favorite status in local storage
  Future<domain.Recipe> setFavorite(String id, bool isFavorite);
  
  /// Gets recipes by tag from local storage
  Future<List<domain.Recipe>> getRecipesByTag(String tag);
  
  /// Searches recipes by query string in local storage
  Future<List<domain.Recipe>> searchRecipes(String query);
}