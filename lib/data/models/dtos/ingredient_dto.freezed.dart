// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IngredientDto {

 String get name; AmountDto get amount; String? get notes;
/// Create a copy of IngredientDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IngredientDtoCopyWith<IngredientDto> get copyWith => _$IngredientDtoCopyWithImpl<IngredientDto>(this as IngredientDto, _$identity);

  /// Serializes this IngredientDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IngredientDto&&(identical(other.name, name) || other.name == name)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,amount,notes);

@override
String toString() {
  return 'IngredientDto(name: $name, amount: $amount, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $IngredientDtoCopyWith<$Res>  {
  factory $IngredientDtoCopyWith(IngredientDto value, $Res Function(IngredientDto) _then) = _$IngredientDtoCopyWithImpl;
@useResult
$Res call({
 String name, AmountDto amount, String? notes
});


$AmountDtoCopyWith<$Res> get amount;

}
/// @nodoc
class _$IngredientDtoCopyWithImpl<$Res>
    implements $IngredientDtoCopyWith<$Res> {
  _$IngredientDtoCopyWithImpl(this._self, this._then);

  final IngredientDto _self;
  final $Res Function(IngredientDto) _then;

/// Create a copy of IngredientDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? amount = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as AmountDto,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of IngredientDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountDtoCopyWith<$Res> get amount {
  
  return $AmountDtoCopyWith<$Res>(_self.amount, (value) {
    return _then(_self.copyWith(amount: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _IngredientDto implements IngredientDto {
  const _IngredientDto({required this.name, required this.amount, this.notes});
  factory _IngredientDto.fromJson(Map<String, dynamic> json) => _$IngredientDtoFromJson(json);

@override final  String name;
@override final  AmountDto amount;
@override final  String? notes;

/// Create a copy of IngredientDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IngredientDtoCopyWith<_IngredientDto> get copyWith => __$IngredientDtoCopyWithImpl<_IngredientDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IngredientDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IngredientDto&&(identical(other.name, name) || other.name == name)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,amount,notes);

@override
String toString() {
  return 'IngredientDto(name: $name, amount: $amount, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$IngredientDtoCopyWith<$Res> implements $IngredientDtoCopyWith<$Res> {
  factory _$IngredientDtoCopyWith(_IngredientDto value, $Res Function(_IngredientDto) _then) = __$IngredientDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, AmountDto amount, String? notes
});


@override $AmountDtoCopyWith<$Res> get amount;

}
/// @nodoc
class __$IngredientDtoCopyWithImpl<$Res>
    implements _$IngredientDtoCopyWith<$Res> {
  __$IngredientDtoCopyWithImpl(this._self, this._then);

  final _IngredientDto _self;
  final $Res Function(_IngredientDto) _then;

/// Create a copy of IngredientDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? amount = null,Object? notes = freezed,}) {
  return _then(_IngredientDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as AmountDto,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of IngredientDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountDtoCopyWith<$Res> get amount {
  
  return $AmountDtoCopyWith<$Res>(_self.amount, (value) {
    return _then(_self.copyWith(amount: value));
  });
}
}


/// @nodoc
mixin _$AmountDto {

 double get value; String get label;
/// Create a copy of AmountDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AmountDtoCopyWith<AmountDto> get copyWith => _$AmountDtoCopyWithImpl<AmountDto>(this as AmountDto, _$identity);

  /// Serializes this AmountDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AmountDto&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,label);

@override
String toString() {
  return 'AmountDto(value: $value, label: $label)';
}


}

/// @nodoc
abstract mixin class $AmountDtoCopyWith<$Res>  {
  factory $AmountDtoCopyWith(AmountDto value, $Res Function(AmountDto) _then) = _$AmountDtoCopyWithImpl;
@useResult
$Res call({
 double value, String label
});




}
/// @nodoc
class _$AmountDtoCopyWithImpl<$Res>
    implements $AmountDtoCopyWith<$Res> {
  _$AmountDtoCopyWithImpl(this._self, this._then);

  final AmountDto _self;
  final $Res Function(AmountDto) _then;

/// Create a copy of AmountDto
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

class _AmountDto implements AmountDto {
  const _AmountDto({required this.value, required this.label});
  factory _AmountDto.fromJson(Map<String, dynamic> json) => _$AmountDtoFromJson(json);

@override final  double value;
@override final  String label;

/// Create a copy of AmountDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AmountDtoCopyWith<_AmountDto> get copyWith => __$AmountDtoCopyWithImpl<_AmountDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AmountDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AmountDto&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,label);

@override
String toString() {
  return 'AmountDto(value: $value, label: $label)';
}


}

/// @nodoc
abstract mixin class _$AmountDtoCopyWith<$Res> implements $AmountDtoCopyWith<$Res> {
  factory _$AmountDtoCopyWith(_AmountDto value, $Res Function(_AmountDto) _then) = __$AmountDtoCopyWithImpl;
@override @useResult
$Res call({
 double value, String label
});




}
/// @nodoc
class __$AmountDtoCopyWithImpl<$Res>
    implements _$AmountDtoCopyWith<$Res> {
  __$AmountDtoCopyWithImpl(this._self, this._then);

  final _AmountDto _self;
  final $Res Function(_AmountDto) _then;

/// Create a copy of AmountDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? label = null,}) {
  return _then(_AmountDto(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
