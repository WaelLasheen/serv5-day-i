import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/auth/domain/entity/auth_entity.dart';
import 'package:day_i/features/auth/domain/params/login_params.dart';
import 'package:day_i/features/auth/domain/repository/repository.dart';

class LoginUseCase {
  final Repository repository;
  LoginUseCase({required this.repository});

  Future<Either<Failure, AuthEntity>> call(LoginParams params) {
    return repository.login(params);
  }
}
