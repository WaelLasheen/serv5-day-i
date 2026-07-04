import 'package:day_i/features/auth/domain/entity/user_entity.dart';

class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? tenantId;
  final String? googleId;
  final String? avatar;
  final DateTime? emailVerifiedAt;
  final String? rememberToken;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
    this.tenantId,
    this.googleId,
    this.avatar,
    this.emailVerifiedAt,
    this.rememberToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      password: json['password'] as String? ?? '',
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      tenantId: json['tenant_id'] as int?,
      googleId: json['google_id'] as String?,
      avatar: json['avatar'] as String?,
      emailVerifiedAt: json['email_verified_at'] != null
          ? DateTime.parse(json['email_verified_at'])
          : null,
      rememberToken: json['remember_token'] as String?,
    );
  }
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      phone: phone,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
