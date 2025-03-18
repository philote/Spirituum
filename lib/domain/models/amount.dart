import 'package:freezed_annotation/freezed_annotation.dart';

part 'amount.freezed.dart';
part 'amount.g.dart';

/// Amount model representing a unit of measurement and its value
@freezed
abstract class Amount with _$Amount {
  const factory Amount({
    required double value,
    required String label,
  }) = _Amount;

  factory Amount.fromJson(Map<String, dynamic> json) => _$AmountFromJson(json);
}