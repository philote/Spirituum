import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spirituum/data/repositories/recipe_repository_impl.dart';
import 'package:spirituum/domain/models/recipe.dart';

/// A provider for getting a recipe by ID
/// This is used by various screens that need to access a specific recipe
final recipeProvider = FutureProvider.family<Recipe?, String>(
  (ref, id) => ref.watch(recipeRepositoryProvider).getRecipeById(id),
);