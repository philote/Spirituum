import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spirituum/domain/models/recipe.dart';

part 'ingredient_dto.freezed.dart';
part 'ingredient_dto.g.dart';

/// Data Transfer Object for Ingredient
/// 
/// Used to communicate with APIs and database
@freezed
abstract class IngredientDto with _$IngredientDto {
  const factory IngredientDto({
    required String name,
    required AmountDto amount,
    String? notes,
  }) = _IngredientDto;

  factory IngredientDto.fromJson(Map<String, dynamic> json) => _$IngredientDtoFromJson(json);
}

/// Create DTO from domain model
IngredientDto ingredientFromDomain(Ingredient ingredient) => IngredientDto(
  name: ingredient.name,
  amount: amountFromDomain(ingredient.amount),
  notes: ingredient.notes,
);

/// Function for converting DTO to domain model
Ingredient ingredientToDomain(IngredientDto ingredientDto) => Ingredient(
  name: ingredientDto.name,
  amount: amountToDomain(ingredientDto.amount),
  notes: ingredientDto.notes,
);

/// Data Transfer Object for Amount
///
/// Used to communicate with APIs and database
@freezed
abstract class AmountDto with _$AmountDto {
  const factory AmountDto({
    required double value,
    required String label,
  }) = _AmountDto;

  factory AmountDto.fromJson(Map<String, dynamic> json) => _$AmountDtoFromJson(json);
}

/// Create DTO from domain model
AmountDto amountFromDomain(Amount amount) => AmountDto(
  value: amount.value,
  label: amount.label,
);

/// Function for converting DTO to domain model
Amount amountToDomain(AmountDto amountDto) => Amount(
  value: amountDto.value,
  label: amountDto.label,
);