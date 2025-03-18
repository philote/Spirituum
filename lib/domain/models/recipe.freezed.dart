// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Tag implements DiagnosticableTreeMixin {

 String get value;
/// Create a copy of Tag
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TagCopyWith<Tag> get copyWith => _$TagCopyWithImpl<Tag>(this as Tag, _$identity);

  /// Serializes this Tag to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Tag'))
    ..add(DiagnosticsProperty('value', value));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tag&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Tag(value: $value)';
}


}

/// @nodoc
abstract mixin class $TagCopyWith<$Res>  {
  factory $TagCopyWith(Tag value, $Res Function(Tag) _then) = _$TagCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$TagCopyWithImpl<$Res>
    implements $TagCopyWith<$Res> {
  _$TagCopyWithImpl(this._self, this._then);

  final Tag _self;
  final $Res Function(Tag) _then;

/// Create a copy of Tag
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Tag with DiagnosticableTreeMixin implements Tag {
  const _Tag({required this.value});
  factory _Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

@override final  String value;

/// Create a copy of Tag
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TagCopyWith<_Tag> get copyWith => __$TagCopyWithImpl<_Tag>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TagToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Tag'))
    ..add(DiagnosticsProperty('value', value));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tag&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Tag(value: $value)';
}


}

/// @nodoc
abstract mixin class _$TagCopyWith<$Res> implements $TagCopyWith<$Res> {
  factory _$TagCopyWith(_Tag value, $Res Function(_Tag) _then) = __$TagCopyWithImpl;
@override @useResult
$Res call({
 String value
});




}
/// @nodoc
class __$TagCopyWithImpl<$Res>
    implements _$TagCopyWith<$Res> {
  __$TagCopyWithImpl(this._self, this._then);

  final _Tag _self;
  final $Res Function(_Tag) _then;

/// Create a copy of Tag
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_Tag(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Amount implements DiagnosticableTreeMixin {

 double get value; String get label;
/// Create a copy of Amount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AmountCopyWith<Amount> get copyWith => _$AmountCopyWithImpl<Amount>(this as Amount, _$identity);

  /// Serializes this Amount to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Amount'))
    ..add(DiagnosticsProperty('value', value))..add(DiagnosticsProperty('label', label));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Amount&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,label);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Amount(value: $value, label: $label)';
}


}

/// @nodoc
abstract mixin class $AmountCopyWith<$Res>  {
  factory $AmountCopyWith(Amount value, $Res Function(Amount) _then) = _$AmountCopyWithImpl;
@useResult
$Res call({
 double value, String label
});




}
/// @nodoc
class _$AmountCopyWithImpl<$Res>
    implements $AmountCopyWith<$Res> {
  _$AmountCopyWithImpl(this._self, this._then);

  final Amount _self;
  final $Res Function(Amount) _then;

/// Create a copy of Amount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? label = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Amount with DiagnosticableTreeMixin implements Amount {
  const _Amount({required this.value, required this.label});
  factory _Amount.fromJson(Map<String, dynamic> json) => _$AmountFromJson(json);

@override final  double value;
@override final  String label;

/// Create a copy of Amount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AmountCopyWith<_Amount> get copyWith => __$AmountCopyWithImpl<_Amount>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AmountToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Amount'))
    ..add(DiagnosticsProperty('value', value))..add(DiagnosticsProperty('label', label));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Amount&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,label);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Amount(value: $value, label: $label)';
}


}

/// @nodoc
abstract mixin class _$AmountCopyWith<$Res> implements $AmountCopyWith<$Res> {
  factory _$AmountCopyWith(_Amount value, $Res Function(_Amount) _then) = __$AmountCopyWithImpl;
@override @useResult
$Res call({
 double value, String label
});




}
/// @nodoc
class __$AmountCopyWithImpl<$Res>
    implements _$AmountCopyWith<$Res> {
  __$AmountCopyWithImpl(this._self, this._then);

  final _Amount _self;
  final $Res Function(_Amount) _then;

/// Create a copy of Amount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? label = null,}) {
  return _then(_Amount(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Instruction implements DiagnosticableTreeMixin {

 String get value;// markdown or rich text
 int get step;
/// Create a copy of Instruction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InstructionCopyWith<Instruction> get copyWith => _$InstructionCopyWithImpl<Instruction>(this as Instruction, _$identity);

  /// Serializes this Instruction to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Instruction'))
    ..add(DiagnosticsProperty('value', value))..add(DiagnosticsProperty('step', step));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Instruction&&(identical(other.value, value) || other.value == value)&&(identical(other.step, step) || other.step == step));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,step);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Instruction(value: $value, step: $step)';
}


}

/// @nodoc
abstract mixin class $InstructionCopyWith<$Res>  {
  factory $InstructionCopyWith(Instruction value, $Res Function(Instruction) _then) = _$InstructionCopyWithImpl;
@useResult
$Res call({
 String value, int step
});




}
/// @nodoc
class _$InstructionCopyWithImpl<$Res>
    implements $InstructionCopyWith<$Res> {
  _$InstructionCopyWithImpl(this._self, this._then);

  final Instruction _self;
  final $Res Function(Instruction) _then;

/// Create a copy of Instruction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? step = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Instruction with DiagnosticableTreeMixin implements Instruction {
  const _Instruction({required this.value, required this.step});
  factory _Instruction.fromJson(Map<String, dynamic> json) => _$InstructionFromJson(json);

@override final  String value;
// markdown or rich text
@override final  int step;

/// Create a copy of Instruction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InstructionCopyWith<_Instruction> get copyWith => __$InstructionCopyWithImpl<_Instruction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InstructionToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Instruction'))
    ..add(DiagnosticsProperty('value', value))..add(DiagnosticsProperty('step', step));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Instruction&&(identical(other.value, value) || other.value == value)&&(identical(other.step, step) || other.step == step));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,step);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Instruction(value: $value, step: $step)';
}


}

/// @nodoc
abstract mixin class _$InstructionCopyWith<$Res> implements $InstructionCopyWith<$Res> {
  factory _$InstructionCopyWith(_Instruction value, $Res Function(_Instruction) _then) = __$InstructionCopyWithImpl;
@override @useResult
$Res call({
 String value, int step
});




}
/// @nodoc
class __$InstructionCopyWithImpl<$Res>
    implements _$InstructionCopyWith<$Res> {
  __$InstructionCopyWithImpl(this._self, this._then);

  final _Instruction _self;
  final $Res Function(_Instruction) _then;

/// Create a copy of Instruction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? step = null,}) {
  return _then(_Instruction(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Ingredient implements DiagnosticableTreeMixin {

 String get name; Amount get amount; String? get notes;
/// Create a copy of Ingredient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IngredientCopyWith<Ingredient> get copyWith => _$IngredientCopyWithImpl<Ingredient>(this as Ingredient, _$identity);

  /// Serializes this Ingredient to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Ingredient'))
    ..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('amount', amount))..add(DiagnosticsProperty('notes', notes));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Ingredient&&(identical(other.name, name) || other.name == name)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,amount,notes);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Ingredient(name: $name, amount: $amount, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $IngredientCopyWith<$Res>  {
  factory $IngredientCopyWith(Ingredient value, $Res Function(Ingredient) _then) = _$IngredientCopyWithImpl;
@useResult
$Res call({
 String name, Amount amount, String? notes
});


$AmountCopyWith<$Res> get amount;

}
/// @nodoc
class _$IngredientCopyWithImpl<$Res>
    implements $IngredientCopyWith<$Res> {
  _$IngredientCopyWithImpl(this._self, this._then);

  final Ingredient _self;
  final $Res Function(Ingredient) _then;

/// Create a copy of Ingredient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? amount = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Amount,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Ingredient
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountCopyWith<$Res> get amount {
  
  return $AmountCopyWith<$Res>(_self.amount, (value) {
    return _then(_self.copyWith(amount: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Ingredient with DiagnosticableTreeMixin implements Ingredient {
  const _Ingredient({required this.name, required this.amount, this.notes});
  factory _Ingredient.fromJson(Map<String, dynamic> json) => _$IngredientFromJson(json);

@override final  String name;
@override final  Amount amount;
@override final  String? notes;

/// Create a copy of Ingredient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IngredientCopyWith<_Ingredient> get copyWith => __$IngredientCopyWithImpl<_Ingredient>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IngredientToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Ingredient'))
    ..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('amount', amount))..add(DiagnosticsProperty('notes', notes));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ingredient&&(identical(other.name, name) || other.name == name)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,amount,notes);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Ingredient(name: $name, amount: $amount, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$IngredientCopyWith<$Res> implements $IngredientCopyWith<$Res> {
  factory _$IngredientCopyWith(_Ingredient value, $Res Function(_Ingredient) _then) = __$IngredientCopyWithImpl;
@override @useResult
$Res call({
 String name, Amount amount, String? notes
});


@override $AmountCopyWith<$Res> get amount;

}
/// @nodoc
class __$IngredientCopyWithImpl<$Res>
    implements _$IngredientCopyWith<$Res> {
  __$IngredientCopyWithImpl(this._self, this._then);

  final _Ingredient _self;
  final $Res Function(_Ingredient) _then;

/// Create a copy of Ingredient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? amount = null,Object? notes = freezed,}) {
  return _then(_Ingredient(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Amount,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Ingredient
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountCopyWith<$Res> get amount {
  
  return $AmountCopyWith<$Res>(_self.amount, (value) {
    return _then(_self.copyWith(amount: value));
  });
}
}


/// @nodoc
mixin _$Recipe implements DiagnosticableTreeMixin {

 String get id; String get name; String? get altName; String? get imagePath;// path to image
 String? get about;// markdown or rich text
 List<Tag> get tags; List<Instruction> get instructions; String? get notes;// markdown or rich text
 bool get alcoholic; String? get glassware; String? get garnish; List<Ingredient> get ingredients; DateTime? get createdAt; DateTime? get updatedAt; String? get userId;// ID of user who created/owns the recipe
 bool get isPublic; bool get isFavorite;
/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeCopyWith<Recipe> get copyWith => _$RecipeCopyWithImpl<Recipe>(this as Recipe, _$identity);

  /// Serializes this Recipe to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Recipe'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('altName', altName))..add(DiagnosticsProperty('imagePath', imagePath))..add(DiagnosticsProperty('about', about))..add(DiagnosticsProperty('tags', tags))..add(DiagnosticsProperty('instructions', instructions))..add(DiagnosticsProperty('notes', notes))..add(DiagnosticsProperty('alcoholic', alcoholic))..add(DiagnosticsProperty('glassware', glassware))..add(DiagnosticsProperty('garnish', garnish))..add(DiagnosticsProperty('ingredients', ingredients))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('isPublic', isPublic))..add(DiagnosticsProperty('isFavorite', isFavorite));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Recipe&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.altName, altName) || other.altName == altName)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.about, about) || other.about == about)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.instructions, instructions)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.alcoholic, alcoholic) || other.alcoholic == alcoholic)&&(identical(other.glassware, glassware) || other.glassware == glassware)&&(identical(other.garnish, garnish) || other.garnish == garnish)&&const DeepCollectionEquality().equals(other.ingredients, ingredients)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,altName,imagePath,about,const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(instructions),notes,alcoholic,glassware,garnish,const DeepCollectionEquality().hash(ingredients),createdAt,updatedAt,userId,isPublic,isFavorite);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Recipe(id: $id, name: $name, altName: $altName, imagePath: $imagePath, about: $about, tags: $tags, instructions: $instructions, notes: $notes, alcoholic: $alcoholic, glassware: $glassware, garnish: $garnish, ingredients: $ingredients, createdAt: $createdAt, updatedAt: $updatedAt, userId: $userId, isPublic: $isPublic, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class $RecipeCopyWith<$Res>  {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) _then) = _$RecipeCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? altName, String? imagePath, String? about, List<Tag> tags, List<Instruction> instructions, String? notes, bool alcoholic, String? glassware, String? garnish, List<Ingredient> ingredients, DateTime? createdAt, DateTime? updatedAt, String? userId, bool isPublic, bool isFavorite
});




}
/// @nodoc
class _$RecipeCopyWithImpl<$Res>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._self, this._then);

  final Recipe _self;
  final $Res Function(Recipe) _then;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? altName = freezed,Object? imagePath = freezed,Object? about = freezed,Object? tags = null,Object? instructions = null,Object? notes = freezed,Object? alcoholic = null,Object? glassware = freezed,Object? garnish = freezed,Object? ingredients = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? userId = freezed,Object? isPublic = null,Object? isFavorite = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,altName: freezed == altName ? _self.altName : altName // ignore: cast_nullable_to_non_nullable
as String?,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,about: freezed == about ? _self.about : about // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<Tag>,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as List<Instruction>,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,alcoholic: null == alcoholic ? _self.alcoholic : alcoholic // ignore: cast_nullable_to_non_nullable
as bool,glassware: freezed == glassware ? _self.glassware : glassware // ignore: cast_nullable_to_non_nullable
as String?,garnish: freezed == garnish ? _self.garnish : garnish // ignore: cast_nullable_to_non_nullable
as String?,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Recipe with DiagnosticableTreeMixin implements Recipe {
  const _Recipe({required this.id, required this.name, this.altName, this.imagePath, this.about, final  List<Tag> tags = const [], final  List<Instruction> instructions = const [], this.notes, this.alcoholic = false, this.glassware, this.garnish, final  List<Ingredient> ingredients = const [], this.createdAt, this.updatedAt, this.userId, this.isPublic = false, this.isFavorite = false}): _tags = tags,_instructions = instructions,_ingredients = ingredients;
  factory _Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? altName;
@override final  String? imagePath;
// path to image
@override final  String? about;
// markdown or rich text
 final  List<Tag> _tags;
// markdown or rich text
@override@JsonKey() List<Tag> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  List<Instruction> _instructions;
@override@JsonKey() List<Instruction> get instructions {
  if (_instructions is EqualUnmodifiableListView) return _instructions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_instructions);
}

@override final  String? notes;
// markdown or rich text
@override@JsonKey() final  bool alcoholic;
@override final  String? glassware;
@override final  String? garnish;
 final  List<Ingredient> _ingredients;
@override@JsonKey() List<Ingredient> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}

@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override final  String? userId;
// ID of user who created/owns the recipe
@override@JsonKey() final  bool isPublic;
@override@JsonKey() final  bool isFavorite;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeCopyWith<_Recipe> get copyWith => __$RecipeCopyWithImpl<_Recipe>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Recipe'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('altName', altName))..add(DiagnosticsProperty('imagePath', imagePath))..add(DiagnosticsProperty('about', about))..add(DiagnosticsProperty('tags', tags))..add(DiagnosticsProperty('instructions', instructions))..add(DiagnosticsProperty('notes', notes))..add(DiagnosticsProperty('alcoholic', alcoholic))..add(DiagnosticsProperty('glassware', glassware))..add(DiagnosticsProperty('garnish', garnish))..add(DiagnosticsProperty('ingredients', ingredients))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('isPublic', isPublic))..add(DiagnosticsProperty('isFavorite', isFavorite));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Recipe&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.altName, altName) || other.altName == altName)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.about, about) || other.about == about)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._instructions, _instructions)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.alcoholic, alcoholic) || other.alcoholic == alcoholic)&&(identical(other.glassware, glassware) || other.glassware == glassware)&&(identical(other.garnish, garnish) || other.garnish == garnish)&&const DeepCollectionEquality().equals(other._ingredients, _ingredients)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,altName,imagePath,about,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_instructions),notes,alcoholic,glassware,garnish,const DeepCollectionEquality().hash(_ingredients),createdAt,updatedAt,userId,isPublic,isFavorite);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Recipe(id: $id, name: $name, altName: $altName, imagePath: $imagePath, about: $about, tags: $tags, instructions: $instructions, notes: $notes, alcoholic: $alcoholic, glassware: $glassware, garnish: $garnish, ingredients: $ingredients, createdAt: $createdAt, updatedAt: $updatedAt, userId: $userId, isPublic: $isPublic, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class _$RecipeCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$RecipeCopyWith(_Recipe value, $Res Function(_Recipe) _then) = __$RecipeCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? altName, String? imagePath, String? about, List<Tag> tags, List<Instruction> instructions, String? notes, bool alcoholic, String? glassware, String? garnish, List<Ingredient> ingredients, DateTime? createdAt, DateTime? updatedAt, String? userId, bool isPublic, bool isFavorite
});




}
/// @nodoc
class __$RecipeCopyWithImpl<$Res>
    implements _$RecipeCopyWith<$Res> {
  __$RecipeCopyWithImpl(this._self, this._then);

  final _Recipe _self;
  final $Res Function(_Recipe) _then;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? altName = freezed,Object? imagePath = freezed,Object? about = freezed,Object? tags = null,Object? instructions = null,Object? notes = freezed,Object? alcoholic = null,Object? glassware = freezed,Object? garnish = freezed,Object? ingredients = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? userId = freezed,Object? isPublic = null,Object? isFavorite = null,}) {
  return _then(_Recipe(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,altName: freezed == altName ? _self.altName : altName // ignore: cast_nullable_to_non_nullable
as String?,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,about: freezed == about ? _self.about : about // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<Tag>,instructions: null == instructions ? _self._instructions : instructions // ignore: cast_nullable_to_non_nullable
as List<Instruction>,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,alcoholic: null == alcoholic ? _self.alcoholic : alcoholic // ignore: cast_nullable_to_non_nullable
as bool,glassware: freezed == glassware ? _self.glassware : glassware // ignore: cast_nullable_to_non_nullable
as String?,garnish: freezed == garnish ? _self.garnish : garnish // ignore: cast_nullable_to_non_nullable
as String?,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
