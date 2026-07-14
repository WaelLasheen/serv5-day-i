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
      id: json['id'] is int ? json['id'] : int.tryParse(json['id']?.toString() ?? '') ?? 0,
      name: json['name']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      phone: json['phone']?.toString() ?? '',
      createdAt: DateTime.tryParse(json['created_at']?.toString() ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at']?.toString() ?? '') ?? DateTime.now(),
      tenantId: json['tenant_id'] is int ? json['tenant_id'] : int.tryParse(json['tenant_id']?.toString() ?? ''),
      googleId: json['google_id']?.toString(),
      avatar: json['avatar']?.toString(),
      emailVerifiedAt: json['email_verified_at'] != null
          ? DateTime.tryParse(json['email_verified_at']?.toString() ?? '')
          : null,
      rememberToken: json['remember_token']?.toString(),
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
