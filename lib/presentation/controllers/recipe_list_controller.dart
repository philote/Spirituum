import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spirituum/domain/models/recipe.dart';
import 'package:spirituum/data/repositories/recipe_repository_impl.dart';
import 'package:spirituum/application/services/sample_data_service.dart';

part 'recipe_list_controller.g.dart';

/// Controller for the recipe list screen
///
/// Manages the state and business logic for displaying recipes
@riverpod
class RecipeListController extends _$RecipeListController {
  @override
  FutureOr<List<Recipe>> build() async {
    // Load sample data on first run
    await _loadSampleDataIfNeeded();

    // Return all recipes
    return _getRecipes();
  }

  /// Load sample data if the repository is empty
  Future<void> _loadSampleDataIfNeeded() async {
    final recipes = await ref.read(recipeRepositoryProvider).getAllRecipes();
    if (recipes.isEmpty) {
      await ref.read(sampleDataServiceProvider).loadSampleData();
    }
  }

  /// Get all recipes from repository
  Future<List<Recipe>> _getRecipes() async {
    return ref.read(recipeRepositoryProvider).getAllRecipes();
  }

  /// Toggle favorite status of a recipe
  Future<void> toggleFavorite(String recipeId) async {
    final repository = ref.read(recipeRepositoryProvider);
    final recipe = await repository.getRecipeById(recipeId);

    if (recipe != null) {
      await repository.setFavorite(recipeId, !recipe.isFavorite);
      // Refresh the list to reflect changes
      ref.invalidateSelf();
    }
  }
}
