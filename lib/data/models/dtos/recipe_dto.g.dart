// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipeDto _$RecipeDtoFromJson(Map<String, dynamic> json) => _RecipeDto(
  id: json['id'] as String,
  name: json['name'] as String,
  altName: json['altName'] as String?,
  imagePath: json['imagePath'] as String?,
  about: json['about'] as String?,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  instructions:
      (json['instructions'] as List<dynamic>)
          .map((e) => InstructionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
  notes: json['notes'] as String?,
  alcoholic: json['alcoholic'] as bool,
  glassware: json['glassware'] as String?,
  garnish: json['garnish'] as String?,
  ingredients:
      (json['ingredients'] as List<dynamic>)
          .map((e) => IngredientDto.fromJson(e as Map<String, dynamic>))
          .toList(),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  userId: json['userId'] as String?,
  isPublic: json['isPublic'] as bool? ?? false,
  isFavorite: json['isFavorite'] as bool? ?? false,
);

Map<String, dynamic> _$RecipeDtoToJson(_RecipeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'altName': instance.altName,
      'imagePath': instance.imagePath,
      'about': instance.about,
      'tags': instance.tags,
      'instructions': instance.instructions.map((e) => e.toJson()).toList(),
      'notes': instance.notes,
      'alcoholic': instance.alcoholic,
      'glassware': instance.glassware,
      'garnish': instance.garnish,
      'ingredients': instance.ingredients.map((e) => e.toJson()).toList(),
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'userId': instance.userId,
      'isPublic': instance.isPublic,
      'isFavorite': instance.isFavorite,
    };
