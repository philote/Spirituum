import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spirituum/domain/models/recipe.dart';

part 'instruction_dto.freezed.dart';
part 'instruction_dto.g.dart';

/// Data Transfer Object for Instruction
/// 
/// Used to communicate with APIs and database
@freezed
abstract class InstructionDto with _$InstructionDto {
  const factory InstructionDto({
    required String value,
    required int step,
  }) = _InstructionDto;

  factory InstructionDto.fromJson(Map<String, dynamic> json) => _$InstructionDtoFromJson(json);
}

/// Create DTO from domain model
InstructionDto instructionFromDomain(Instruction instruction) => InstructionDto(
  value: instruction.value,
  step: instruction.step,
);

/// Function for converting DTO to domain model
Instruction instructionToDomain(InstructionDto instructionDto) => Instruction(
  value: instructionDto.value,
  step: instructionDto.step,
);