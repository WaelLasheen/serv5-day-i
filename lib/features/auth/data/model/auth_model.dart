import 'package:day_i/features/auth/data/model/user_model.dart';
import 'package:day_i/features/auth/domain/entity/auth_entity.dart';

class AuthModel {
  final UserModel user;
  final String message;

  AuthModel({required this.user, required this.message});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      user: UserModel.fromJson(json['user']),
      message: json['message'],
    );
  }

  AuthEntity toEntity() {
    return AuthEntity(user: user.toEntity(), message: message);
  }
}
