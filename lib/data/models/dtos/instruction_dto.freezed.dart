// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'instruction_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InstructionDto {

 String get value; int get step;
/// Create a copy of InstructionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InstructionDtoCopyWith<InstructionDto> get copyWith => _$InstructionDtoCopyWithImpl<InstructionDto>(this as InstructionDto, _$identity);

  /// Serializes this InstructionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InstructionDto&&(identical(other.value, value) || other.value == value)&&(identical(other.step, step) || other.step == step));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,step);

@override
String toString() {
  return 'InstructionDto(value: $value, step: $step)';
}


}

/// @nodoc
abstract mixin class $InstructionDtoCopyWith<$Res>  {
  factory $InstructionDtoCopyWith(InstructionDto value, $Res Function(InstructionDto) _then) = _$InstructionDtoCopyWithImpl;
@useResult
$Res call({
 String value, int step
});




}
/// @nodoc
class _$InstructionDtoCopyWithImpl<$Res>
    implements $InstructionDtoCopyWith<$Res> {
  _$InstructionDtoCopyWithImpl(this._self, this._then);

  final InstructionDto _self;
  final $Res Function(InstructionDto) _then;

/// Create a copy of InstructionDto
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

class _InstructionDto implements InstructionDto {
  const _InstructionDto({required this.value, required this.step});
  factory _InstructionDto.fromJson(Map<String, dynamic> json) => _$InstructionDtoFromJson(json);

@override final  String value;
@override final  int step;

/// Create a copy of InstructionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InstructionDtoCopyWith<_InstructionDto> get copyWith => __$InstructionDtoCopyWithImpl<_InstructionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InstructionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InstructionDto&&(identical(other.value, value) || other.value == value)&&(identical(other.step, step) || other.step == step));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,step);

@override
String toString() {
  return 'InstructionDto(value: $value, step: $step)';
}


}

/// @nodoc
abstract mixin class _$InstructionDtoCopyWith<$Res> implements $InstructionDtoCopyWith<$Res> {
  factory _$InstructionDtoCopyWith(_InstructionDto value, $Res Function(_InstructionDto) _then) = __$InstructionDtoCopyWithImpl;
@override @useResult
$Res call({
 String value, int step
});




}
/// @nodoc
class __$InstructionDtoCopyWithImpl<$Res>
    implements _$InstructionDtoCopyWith<$Res> {
  __$InstructionDtoCopyWithImpl(this._self, this._then);

  final _InstructionDto _self;
  final $Res Function(_InstructionDto) _then;

/// Create a copy of InstructionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? step = null,}) {
  return _then(_InstructionDto(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
