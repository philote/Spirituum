// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecipeDto {

 String get id; String get name; String? get altName; String? get imagePath; String? get about; List<String> get tags; List<InstructionDto> get instructions; String? get notes; bool get alcoholic; String? get glassware; String? get garnish; List<IngredientDto> get ingredients; String? get createdAt; String? get updatedAt; String? get userId; bool get isPublic; bool get isFavorite;
/// Create a copy of RecipeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeDtoCopyWith<RecipeDto> get copyWith => _$RecipeDtoCopyWithImpl<RecipeDto>(this as RecipeDto, _$identity);

  /// Serializes this RecipeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.altName, altName) || other.altName == altName)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.about, about) || other.about == about)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.instructions, instructions)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.alcoholic, alcoholic) || other.alcoholic == alcoholic)&&(identical(other.glassware, glassware) || other.glassware == glassware)&&(identical(other.garnish, garnish) || other.garnish == garnish)&&const DeepCollectionEquality().equals(other.ingredients, ingredients)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,altName,imagePath,about,const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(instructions),notes,alcoholic,glassware,garnish,const DeepCollectionEquality().hash(ingredients),createdAt,updatedAt,userId,isPublic,isFavorite);

@override
String toString() {
  return 'RecipeDto(id: $id, name: $name, altName: $altName, imagePath: $imagePath, about: $about, tags: $tags, instructions: $instructions, notes: $notes, alcoholic: $alcoholic, glassware: $glassware, garnish: $garnish, ingredients: $ingredients, createdAt: $createdAt, updatedAt: $updatedAt, userId: $userId, isPublic: $isPublic, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class $RecipeDtoCopyWith<$Res>  {
  factory $RecipeDtoCopyWith(RecipeDto value, $Res Function(RecipeDto) _then) = _$RecipeDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? altName, String? imagePath, String? about, List<String> tags, List<InstructionDto> instructions, String? notes, bool alcoholic, String? glassware, String? garnish, List<IngredientDto> ingredients, String? createdAt, String? updatedAt, String? userId, bool isPublic, bool isFavorite
});




}
/// @nodoc
class _$RecipeDtoCopyWithImpl<$Res>
    implements $RecipeDtoCopyWith<$Res> {
  _$RecipeDtoCopyWithImpl(this._self, this._then);

  final RecipeDto _self;
  final $Res Function(RecipeDto) _then;

/// Create a copy of RecipeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? altName = freezed,Object? imagePath = freezed,Object? about = freezed,Object? tags = null,Object? instructions = null,Object? notes = freezed,Object? alcoholic = null,Object? glassware = freezed,Object? garnish = freezed,Object? ingredients = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? userId = freezed,Object? isPublic = null,Object? isFavorite = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,altName: freezed == altName ? _self.altName : altName // ignore: cast_nullable_to_non_nullable
as String?,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,about: freezed == about ? _self.about : about // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as List<InstructionDto>,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,alcoholic: null == alcoholic ? _self.alcoholic : alcoholic // ignore: cast_nullable_to_non_nullable
as bool,glassware: freezed == glassware ? _self.glassware : glassware // ignore: cast_nullable_to_non_nullable
as String?,garnish: freezed == garnish ? _self.garnish : garnish // ignore: cast_nullable_to_non_nullable
as String?,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<IngredientDto>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _RecipeDto implements RecipeDto {
  const _RecipeDto({required this.id, required this.name, this.altName, this.imagePath, this.about, final  List<String> tags = const [], required final  List<InstructionDto> instructions, this.notes, required this.alcoholic, this.glassware, this.garnish, required final  List<IngredientDto> ingredients, this.createdAt, this.updatedAt, this.userId, this.isPublic = false, this.isFavorite = false}): _tags = tags,_instructions = instructions,_ingredients = ingredients;
  factory _RecipeDto.fromJson(Map<String, dynamic> json) => _$RecipeDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? altName;
@override final  String? imagePath;
@override final  String? about;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  List<InstructionDto> _instructions;
@override List<InstructionDto> get instructions {
  if (_instructions is EqualUnmodifiableListView) return _instructions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_instructions);
}

@override final  String? notes;
@override final  bool alcoholic;
@override final  String? glassware;
@override final  String? garnish;
 final  List<IngredientDto> _ingredients;
@override List<IngredientDto> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}

@override final  String? createdAt;
@override final  String? updatedAt;
@override final  String? userId;
@override@JsonKey() final  bool isPublic;
@override@JsonKey() final  bool isFavorite;

/// Create a copy of RecipeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeDtoCopyWith<_RecipeDto> get copyWith => __$RecipeDtoCopyWithImpl<_RecipeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.altName, altName) || other.altName == altName)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.about, about) || other.about == about)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._instructions, _instructions)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.alcoholic, alcoholic) || other.alcoholic == alcoholic)&&(identical(other.glassware, glassware) || other.glassware == glassware)&&(identical(other.garnish, garnish) || other.garnish == garnish)&&const DeepCollectionEquality().equals(other._ingredients, _ingredients)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,altName,imagePath,about,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_instructions),notes,alcoholic,glassware,garnish,const DeepCollectionEquality().hash(_ingredients),createdAt,updatedAt,userId,isPublic,isFavorite);

@override
String toString() {
  return 'RecipeDto(id: $id, name: $name, altName: $altName, imagePath: $imagePath, about: $about, tags: $tags, instructions: $instructions, notes: $notes, alcoholic: $alcoholic, glassware: $glassware, garnish: $garnish, ingredients: $ingredients, createdAt: $createdAt, updatedAt: $updatedAt, userId: $userId, isPublic: $isPublic, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class _$RecipeDtoCopyWith<$Res> implements $RecipeDtoCopyWith<$Res> {
  factory _$RecipeDtoCopyWith(_RecipeDto value, $Res Function(_RecipeDto) _then) = __$RecipeDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? altName, String? imagePath, String? about, List<String> tags, List<InstructionDto> instructions, String? notes, bool alcoholic, String? glassware, String? garnish, List<IngredientDto> ingredients, String? createdAt, String? updatedAt, String? userId, bool isPublic, bool isFavorite
});




}
/// @nodoc
class __$RecipeDtoCopyWithImpl<$Res>
    implements _$RecipeDtoCopyWith<$Res> {
  __$RecipeDtoCopyWithImpl(this._self, this._then);

  final _RecipeDto _self;
  final $Res Function(_RecipeDto) _then;

/// Create a copy of RecipeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? altName = freezed,Object? imagePath = freezed,Object? about = freezed,Object? tags = null,Object? instructions = null,Object? notes = freezed,Object? alcoholic = null,Object? glassware = freezed,Object? garnish = freezed,Object? ingredients = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? userId = freezed,Object? isPublic = null,Object? isFavorite = null,}) {
  return _then(_RecipeDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,altName: freezed == altName ? _self.altName : altName // ignore: cast_nullable_to_non_nullable
as String?,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,about: freezed == about ? _self.about : about // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,instructions: null == instructions ? _self._instructions : instructions // ignore: cast_nullable_to_non_nullable
as List<InstructionDto>,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,alcoholic: null == alcoholic ? _self.alcoholic : alcoholic // ignore: cast_nullable_to_non_nullable
as bool,glassware: freezed == glassware ? _self.glassware : glassware // ignore: cast_nullable_to_non_nullable
as String?,garnish: freezed == garnish ? _self.garnish : garnish // ignore: cast_nullable_to_non_nullable
as String?,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<IngredientDto>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
