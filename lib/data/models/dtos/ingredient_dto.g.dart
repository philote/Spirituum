// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IngredientDto _$IngredientDtoFromJson(Map<String, dynamic> json) =>
    _IngredientDto(
      name: json['name'] as String,
      amount: AmountDto.fromJson(json['amount'] as Map<String, dynamic>),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$IngredientDtoToJson(_IngredientDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount.toJson(),
      'notes': instance.notes,
    };

_AmountDto _$AmountDtoFromJson(Map<String, dynamic> json) => _AmountDto(
  value: (json['value'] as num).toDouble(),
  label: json['label'] as String,
);

Map<String, dynamic> _$AmountDtoToJson(_AmountDto instance) =>
    <String, dynamic>{'value': instance.value, 'label': instance.label};
