import 'package:freezed_annotation/freezed_annotation.dart';
import 'amount.dart';

part 'ingredient.freezed.dart';
part 'ingredient.g.dart';

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