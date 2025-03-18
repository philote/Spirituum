// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instruction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Instruction _$InstructionFromJson(Map<String, dynamic> json) => _Instruction(
  value: json['value'] as String,
  step: (json['step'] as num).toInt(),
);

Map<String, dynamic> _$InstructionToJson(_Instruction instance) =>
    <String, dynamic>{'value': instance.value, 'step': instance.step};
