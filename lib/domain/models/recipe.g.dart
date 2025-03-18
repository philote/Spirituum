// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Tag _$TagFromJson(Map<String, dynamic> json) =>
    _Tag(value: json['value'] as String);

Map<String, dynamic> _$TagToJson(_Tag instance) => <String, dynamic>{
  'value': instance.value,
};

_Amount _$AmountFromJson(Map<String, dynamic> json) => _Amount(
  value: (json['value'] as num).toDouble(),
  label: json['label'] as String,
);

Map<String, dynamic> _$AmountToJson(_Amount instance) => <String, dynamic>{
  'value': instance.value,
  'label': instance.label,
};

_Instruction _$InstructionFromJson(Map<String, dynamic> json) => _Instruction(
  value: json['value'] as String,
  step: (json['step'] as num).toInt(),
);

Map<String, dynamic> _$InstructionToJson(_Instruction instance) =>
    <String, dynamic>{'value': instance.value, 'step': instance.step};

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

_Recipe _$RecipeFromJson(Map<String, dynamic> json) => _Recipe(
  id: json['id'] as String,
  name: json['name'] as String,
  altName: json['altName'] as String?,
  imagePath: json['imagePath'] as String?,
  about: json['about'] as String?,
  tags:
      (json['tags'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  instructions:
      (json['instructions'] as List<dynamic>?)
          ?.map((e) => Instruction.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  notes: json['notes'] as String?,
  alcoholic: json['alcoholic'] as bool? ?? false,
  glassware: json['glassware'] as String?,
  garnish: json['garnish'] as String?,
  ingredients:
      (json['ingredients'] as List<dynamic>?)
          ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
  updatedAt:
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
  userId: json['userId'] as String?,
  isPublic: json['isPublic'] as bool? ?? false,
  isFavorite: json['isFavorite'] as bool? ?? false,
);

Map<String, dynamic> _$RecipeToJson(_Recipe instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'altName': instance.altName,
  'imagePath': instance.imagePath,
  'about': instance.about,
  'tags': instance.tags.map((e) => e.toJson()).toList(),
  'instructions': instance.instructions.map((e) => e.toJson()).toList(),
  'notes': instance.notes,
  'alcoholic': instance.alcoholic,
  'glassware': instance.glassware,
  'garnish': instance.garnish,
  'ingredients': instance.ingredients.map((e) => e.toJson()).toList(),
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'userId': instance.userId,
  'isPublic': instance.isPublic,
  'isFavorite': instance.isFavorite,
};
