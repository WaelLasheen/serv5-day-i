import 'package:day_i/features/auth/domain/entity/verify_entity.dart';

class VerifyModel {
  final String message;
  final String token;

  VerifyModel({required this.message, required this.token});

  factory VerifyModel.fromJson(Map<String, dynamic> json) {
    return VerifyModel(message: json['message'], token: json['token']);
  }

  VerifyEntity toEntity() {
    return VerifyEntity(message: message, token: token);
  }
}
