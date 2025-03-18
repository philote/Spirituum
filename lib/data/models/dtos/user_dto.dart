import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spirituum/domain/models/user.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

/// Data Transfer Object for User
/// 
/// Used to communicate with APIs and database
@freezed
abstract class UserDto with _$UserDto {
  const factory UserDto({
    required String id,
    required String email,
    String? displayName,
    String? avatarUrl,
    @Default(false) bool isAuthenticated,
    String? lastSignInAt,
    String? createdAt,
    String? updatedAt,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
}

/// Create DTO from domain model
UserDto userFromDomain(User user) => UserDto(
  id: user.id,
  email: user.email,
  displayName: user.displayName,
  avatarUrl: user.avatarUrl,
  isAuthenticated: user.isAuthenticated,
  lastSignInAt: user.lastSignInAt?.toIso8601String(),
  createdAt: user.createdAt?.toIso8601String(),
  updatedAt: user.updatedAt?.toIso8601String(),
);

/// Function for converting DTO to domain model
User userToDomain(UserDto userDto) {
  return User(
    id: userDto.id,
    email: userDto.email,
    displayName: userDto.displayName,
    avatarUrl: userDto.avatarUrl,
    isAuthenticated: userDto.isAuthenticated,
    lastSignInAt: userDto.lastSignInAt != null ? DateTime.parse(userDto.lastSignInAt!) : null,
    createdAt: userDto.createdAt != null ? DateTime.parse(userDto.createdAt!) : null,
    updatedAt: userDto.updatedAt != null ? DateTime.parse(userDto.updatedAt!) : null,
  );
}