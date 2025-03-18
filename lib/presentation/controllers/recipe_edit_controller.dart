import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spirituum/data/repositories/recipe_repository_impl.dart';
import 'package:spirituum/domain/models/recipe.dart';
import 'package:spirituum/presentation/controllers/recipe_list_controller.dart';
import 'package:spirituum/presentation/controllers/recipe_provider.dart';
import 'package:flutter/foundation.dart';

part 'recipe_edit_controller.g.dart';

/// A controller for editing and creating recipes
@riverpod
class RecipeEditController extends _$RecipeEditController {
  @override
  FutureOr<Recipe?> build(String? recipeId) async {
    // If recipeId is null, create a new empty recipe
    if (recipeId == null) {
      return Recipe.create(name: '');
    }
    
    // Otherwise, load the existing recipe
    final repository = ref.read(recipeRepositoryProvider);
    return repository.getRecipeById(recipeId);
  }
  
  /// Save the recipe (create or update)
  Future<Recipe> saveRecipe(Recipe recipe) async {
    final repository = ref.read(recipeRepositoryProvider);
    
    // Debug output to help troubleshoot
    debugPrint('Saving recipe: ${recipe.id}');
    
    final savedRecipe = await repository.saveRecipe(recipe);
    
    // Update the state with the saved recipe
    state = AsyncData(savedRecipe);
    
    // Invalidate the recipe list controller to refresh all lists containing recipes
    ref.invalidate(recipeListControllerProvider);
    
    // If we're editing an existing recipe, we need to invalidate the specific recipe provider
    if (recipe.id.isNotEmpty) {
      debugPrint('Invalidating recipe provider for ${recipe.id}');
      ref.invalidate(recipeProvider(recipe.id));
    }
    
    return savedRecipe;
  }

  /// Update the recipe in the state (without saving to database)
  void updateRecipe(Recipe recipe) {
    state = AsyncData(recipe);
  }
  
  /// Add a new empty ingredient to the recipe
  Future<Recipe?> addIngredient(Recipe recipe) async {
    final newIngredient = Ingredient(
      name: '',
      amount: const Amount(value: 0, label: ''),
    );
    
    final updatedRecipe = recipe.copyWith(
      ingredients: [...recipe.ingredients, newIngredient],
    );
    
    state = AsyncData(updatedRecipe);
    return updatedRecipe;
  }
  
  /// Remove an ingredient from the recipe
  Future<Recipe?> removeIngredient(Recipe recipe, int index) async {
    if (index < 0 || index >= recipe.ingredients.length) {
      return recipe;
    }
    
    final newIngredients = [...recipe.ingredients];
    newIngredients.removeAt(index);
    
    final updatedRecipe = recipe.copyWith(ingredients: newIngredients);
    state = AsyncData(updatedRecipe);
    return updatedRecipe;
  }
  
  /// Update an ingredient in the recipe
  Future<Recipe?> updateIngredient(Recipe recipe, int index, Ingredient ingredient) async {
    if (index < 0 || index >= recipe.ingredients.length) {
      return recipe;
    }
    
    final newIngredients = [...recipe.ingredients];
    newIngredients[index] = ingredient;
    
    final updatedRecipe = recipe.copyWith(ingredients: newIngredients);
    state = AsyncData(updatedRecipe);
    return updatedRecipe;
  }
  
  /// Add a new instruction to the recipe
  Future<Recipe?> addInstruction(Recipe recipe) async {
    final step = recipe.instructions.isEmpty 
      ? 1 
      : recipe.instructions.map((i) => i.step).reduce((a, b) => a > b ? a : b) + 1;
    
    final newInstruction = Instruction(
      value: '',
      step: step,
    );
    
    final updatedRecipe = recipe.copyWith(
      instructions: [...recipe.instructions, newInstruction],
    );
    
    state = AsyncData(updatedRecipe);
    return updatedRecipe;
  }
  
  /// Remove an instruction from the recipe
  Future<Recipe?> removeInstruction(Recipe recipe, int index) async {
    if (index < 0 || index >= recipe.instructions.length) {
      return recipe;
    }
    
    final newInstructions = [...recipe.instructions];
    newInstructions.removeAt(index);
    
    // Reorder steps if needed
    for (var i = 0; i < newInstructions.length; i++) {
      newInstructions[i] = newInstructions[i].copyWith(step: i + 1);
    }
    
    final updatedRecipe = recipe.copyWith(instructions: newInstructions);
    state = AsyncData(updatedRecipe);
    return updatedRecipe;
  }
  
  /// Update an instruction in the recipe
  Future<Recipe?> updateInstruction(Recipe recipe, int index, Instruction instruction) async {
    if (index < 0 || index >= recipe.instructions.length) {
      return recipe;
    }
    
    final newInstructions = [...recipe.instructions];
    newInstructions[index] = instruction;
    
    final updatedRecipe = recipe.copyWith(instructions: newInstructions);
    state = AsyncData(updatedRecipe);
    return updatedRecipe;
  }
  
  /// Add a tag to the recipe
  Future<Recipe?> addTag(Recipe recipe, String tagValue) async {
    if (tagValue.isEmpty) {
      return recipe;
    }
    
    // Check if tag already exists
    if (recipe.tags.any((tag) => tag.value.toLowerCase() == tagValue.toLowerCase())) {
      return recipe;
    }
    
    final newTag = Tag(value: tagValue);
    final updatedRecipe = recipe.copyWith(
      tags: [...recipe.tags, newTag],
    );
    
    state = AsyncData(updatedRecipe);
    return updatedRecipe;
  }
  
  /// Remove a tag from the recipe
  Future<Recipe?> removeTag(Recipe recipe, int index) async {
    if (index < 0 || index >= recipe.tags.length) {
      return recipe;
    }
    
    final newTags = [...recipe.tags];
    newTags.removeAt(index);
    
    final updatedRecipe = recipe.copyWith(tags: newTags);
    state = AsyncData(updatedRecipe);
    return updatedRecipe;
  }
}