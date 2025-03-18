import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// User model representing an application user
@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    required String email,
    String? displayName,
    String? avatarUrl,
    @Default(false) bool isAuthenticated,
    DateTime? lastSignInAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Creates a user object from Supabase auth data
  factory User.fromSupabase(Map<String, dynamic> userData, {String? displayName}) {
    final now = DateTime.now();
    
    return User(
      id: userData['id'] as String,
      email: userData['email'] as String,
      displayName: displayName ?? userData['user_metadata']?['full_name'] as String?,
      avatarUrl: userData['user_metadata']?['avatar_url'] as String?,
      isAuthenticated: true,
      lastSignInAt: now,
      createdAt: now,
      updatedAt: now,
    );
  }
}