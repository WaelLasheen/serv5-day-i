import 'package:day_i/features/auth/domain/entity/user_entity.dart';

class AuthEntity {
  final UserEntity user;
  final String message;

  AuthEntity({required this.user, required this.message});
}
