// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Ingredient _$IngredientFromJson(Map<String, dynamic> json) => _Ingredient(
  name: json['name'] as String,
  amount: Amount.fromJson(json['amount'] as Map<String, dynamic>),
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$IngredientToJson(_Ingredient instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount.toJson(),
      'notes': instance.notes,
    };
