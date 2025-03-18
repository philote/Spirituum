import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag.freezed.dart';
part 'tag.g.dart';

/// Tag model representing a recipe tag
@freezed
abstract class Tag with _$Tag {
  const factory Tag({
    required String value,
  }) = _Tag;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}