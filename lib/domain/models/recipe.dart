import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

/// Tag model representing a recipe tag
@freezed
abstract class Tag with _$Tag {
  const factory Tag({
    required String value,
  }) = _Tag;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}

/// Amount model representing a unit of measurement and its value
@freezed
abstract class Amount with _$Amount {
  const factory Amount({
    required double value,
    required String label,
  }) = _Amount;

  factory Amount.fromJson(Map<String, dynamic> json) => _$AmountFromJson(json);
}

/// Instruction model representing a step in the recipe instructions
@freezed
abstract class Instruction with _$Instruction {
  const factory Instruction({
    required String value, // markdown or rich text
    required int step,
  }) = _Instruction;

  factory Instruction.fromJson(Map<String, dynamic> json) => _$InstructionFromJson(json);
}

/// Ingredient model representing a recipe ingredient with amount and notes
@freezed
abstract class Ingredient with _$Ingredient {
  const factory Ingredient({
    required String name,
    required Amount amount,
    String? notes, // markdown or rich text
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, dynamic> json) => _$IngredientFromJson(json);
}

/// Main Recipe model representing a cocktail recipe
@freezed
abstract class Recipe with _$Recipe {
  const factory Recipe({
    required String id,
    required String name,
    String? altName,
    String? imagePath, // path to image
    String? about, // markdown or rich text
    @Default([]) List<Tag> tags,
    @Default([]) List<Instruction> instructions,
    String? notes, // markdown or rich text
    @Default(false) bool alcoholic,
    String? glassware,
    String? garnish,
    @Default([]) List<Ingredient> ingredients,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userId, // ID of user who created/owns the recipe
    @Default(false) bool isPublic,
    @Default(false) bool isFavorite, // Whether the recipe is marked as favorite
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  /// Factory to create a new recipe with a generated UUID
  factory Recipe.create({
    required String name,
    String? altName,
    String? imagePath,
    String? about,
    List<Tag>? tags,
    List<Instruction>? instructions,
    String? notes,
    bool alcoholic = false,
    String? glassware,
    String? garnish,
    List<Ingredient>? ingredients,
    String? userId,
    bool isPublic = false,
    bool isFavorite = false,
  }) {
    final now = DateTime.now();
    return Recipe(
      id: const Uuid().v4(),
      name: name,
      altName: altName,
      imagePath: imagePath,
      about: about,
      tags: tags ?? [],
      instructions: instructions ?? [],
      notes: notes,
      alcoholic: alcoholic,
      glassware: glassware,
      garnish: garnish,
      ingredients: ingredients ?? [],
      createdAt: now,
      updatedAt: now,
      userId: userId,
      isPublic: isPublic,
      isFavorite: isFavorite,
    );
  }
}