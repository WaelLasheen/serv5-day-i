class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? tenantId;
  final String? googleId;
  final String? avatar;
  final String? emailVerifiedAt;
  final String? createdAt;
  final String? updatedAt;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.tenantId,
    this.googleId,
    this.avatar,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      tenantId: json['tenant_id'],
      googleId: json['google_id'],
      avatar: json['avatar'],
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['tenant_id'] = tenantId;
    data['google_id'] = googleId;
    data['avatar'] = avatar;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
