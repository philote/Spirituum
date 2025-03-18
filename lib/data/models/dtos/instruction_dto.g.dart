// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instruction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InstructionDto _$InstructionDtoFromJson(Map<String, dynamic> json) =>
    _InstructionDto(
      value: json['value'] as String,
      step: (json['step'] as num).toInt(),
    );

Map<String, dynamic> _$InstructionDtoToJson(_InstructionDto instance) =>
    <String, dynamic>{'value': instance.value, 'step': instance.step};
