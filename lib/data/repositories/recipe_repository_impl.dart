import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spirituum/data/datasources/local/drift_recipe_local_data_source.dart';
import 'package:spirituum/data/datasources/local/recipe_local_data_source.dart';
import 'package:spirituum/data/services/database_service.dart';
import 'package:spirituum/domain/models/recipe.dart' as domain;
import 'package:spirituum/domain/repositories/recipe_repository.dart';

part 'recipe_repository_impl.g.dart';

/// Implementation of RecipeRepository using local data source
///
/// This implementation uses a local database to store and retrieve recipes
class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeLocalDataSource _localDataSource;

  /// Creates a new RecipeRepositoryImpl with the given local data source
  RecipeRepositoryImpl(this._localDataSource);

  @override
  Future<List<domain.Recipe>> getAllRecipes() =>
      _localDataSource.getAllRecipes();

  @override
  Future<domain.Recipe?> getRecipeById(String id) =>
      _localDataSource.getRecipeById(id);

  @override
  Future<domain.Recipe> saveRecipe(domain.Recipe recipe) =>
      _localDataSource.saveRecipe(recipe);

  @override
  Future<void> deleteRecipe(String id) => _localDataSource.deleteRecipe(id);

  @override
  Future<List<domain.Recipe>> getFavoriteRecipes() =>
      _localDataSource.getFavoriteRecipes();

  @override
  Future<domain.Recipe> setFavorite(String id, bool isFavorite) =>
      _localDataSource.setFavorite(id, isFavorite);

  @override
  Future<List<domain.Recipe>> searchRecipes(String query) =>
      _localDataSource.searchRecipes(query);

  @override
  Future<List<domain.Recipe>> getRecipesByTag(String tag) =>
      _localDataSource.getRecipesByTag(tag);
}

/// Provider for RecipeLocalDataSource
@Riverpod(keepAlive: true)
RecipeLocalDataSource recipeLocalDataSource(RecipeLocalDataSourceRef ref) {
  final database = ref.watch(appDatabaseProvider);
  return DriftRecipeLocalDataSource(database);
}

/// Provider for RecipeRepository
@Riverpod(keepAlive: true)
RecipeRepository recipeRepository(RecipeRepositoryRef ref) {
  final localDataSource = ref.watch(recipeLocalDataSourceProvider);
  return RecipeRepositoryImpl(localDataSource);
}
