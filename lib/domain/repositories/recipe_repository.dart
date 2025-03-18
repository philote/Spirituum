import 'package:spirituum/domain/models/recipe.dart' as domain;

/// Interface for recipe repository
/// 
/// Defines methods to interact with recipe data sources
abstract class RecipeRepository {
  /// Get all recipes
  Future<List<domain.Recipe>> getAllRecipes();
  
  /// Get recipe by ID
  Future<domain.Recipe?> getRecipeById(String id);
  
  /// Add or update a recipe
  Future<domain.Recipe> saveRecipe(domain.Recipe recipe);
  
  /// Delete a recipe
  Future<void> deleteRecipe(String id);
  
  /// Get favorite recipes
  Future<List<domain.Recipe>> getFavoriteRecipes();
  
  /// Set recipe favorite status
  Future<domain.Recipe> setFavorite(String id, bool isFavorite);
  
  /// Search recipes by name or tags
  Future<List<domain.Recipe>> searchRecipes(String query);
  
  /// Get recipes by tag
  Future<List<domain.Recipe>> getRecipesByTag(String tag);
}