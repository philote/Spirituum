import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spirituum/domain/models/recipe.dart';
import 'ingredient_dto.dart';
import 'instruction_dto.dart';

part 'recipe_dto.freezed.dart';
part 'recipe_dto.g.dart';

/// Data Transfer Object for Recipe
/// 
/// Used to communicate with APIs and database
@freezed
abstract class RecipeDto with _$RecipeDto {
  const factory RecipeDto({
    required String id,
    required String name,
    String? altName,
    String? imagePath,
    String? about,
    @Default([]) List<String> tags,
    required List<InstructionDto> instructions,
    String? notes,
    required bool alcoholic,
    String? glassware,
    String? garnish,
    required List<IngredientDto> ingredients,
    String? createdAt,
    String? updatedAt,
    String? userId,
    @Default(false) bool isPublic,
    @Default(false) bool isFavorite,
  }) = _RecipeDto;

  factory RecipeDto.fromJson(Map<String, dynamic> json) => _$RecipeDtoFromJson(json);
}

/// Create DTO from domain model
RecipeDto recipeFromDomain(Recipe recipe) => RecipeDto(
  id: recipe.id,
  name: recipe.name,
  altName: recipe.altName,
  imagePath: recipe.imagePath,
  about: recipe.about,
  tags: recipe.tags.map((tag) => tag.value).toList(),
  instructions: recipe.instructions
      .map((instruction) => instructionFromDomain(instruction))
      .toList(),
  notes: recipe.notes,
  alcoholic: recipe.alcoholic,
  glassware: recipe.glassware,
  garnish: recipe.garnish,
  ingredients: recipe.ingredients
      .map((ingredient) => ingredientFromDomain(ingredient))
      .toList(),
  createdAt: recipe.createdAt?.toIso8601String(),
  updatedAt: recipe.updatedAt?.toIso8601String(),
  userId: recipe.userId,
  isPublic: recipe.isPublic,
  isFavorite: recipe.isFavorite,
);

/// Function for converting DTO to domain model
Recipe recipeToDomain(RecipeDto recipeDto) {
  return Recipe(
    id: recipeDto.id,
    name: recipeDto.name,
    altName: recipeDto.altName,
    imagePath: recipeDto.imagePath,
    about: recipeDto.about,
    tags: recipeDto.tags.map((tagString) => Tag(value: tagString)).toList(),
    instructions: 
        recipeDto.instructions.map((instruction) => instructionToDomain(instruction)).toList(),
    notes: recipeDto.notes,
    alcoholic: recipeDto.alcoholic,
    glassware: recipeDto.glassware,
    garnish: recipeDto.garnish,
    ingredients:
        recipeDto.ingredients.map((ingredient) => ingredientToDomain(ingredient)).toList(),
    createdAt: recipeDto.createdAt != null ? DateTime.parse(recipeDto.createdAt!) : null,
    updatedAt: recipeDto.updatedAt != null ? DateTime.parse(recipeDto.updatedAt!) : null,
    userId: recipeDto.userId,
    isPublic: recipeDto.isPublic,
    isFavorite: recipeDto.isFavorite,
  );
}