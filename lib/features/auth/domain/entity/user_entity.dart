class UserEntity {
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

  const UserEntity({
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
}
