// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'instruction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Instruction {

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
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Instruction&&(identical(other.value, value) || other.value == value)&&(identical(other.step, step) || other.step == step));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,step);

@override
String toString() {
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

class _Instruction implements Instruction {
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
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Instruction&&(identical(other.value, value) || other.value == value)&&(identical(other.step, step) || other.step == step));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,step);

@override
String toString() {
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

// dart format on
