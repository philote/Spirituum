import 'package:freezed_annotation/freezed_annotation.dart';

part 'instruction.freezed.dart';
part 'instruction.g.dart';

/// Instruction model representing a step in the recipe instructions
@freezed
abstract class Instruction with _$Instruction {
  const factory Instruction({
    required String value, // markdown or rich text
    required int step,
  }) = _Instruction;

  factory Instruction.fromJson(Map<String, dynamic> json) => _$InstructionFromJson(json);
}