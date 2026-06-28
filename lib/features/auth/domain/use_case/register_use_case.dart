import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/auth/domain/entity/auth_entity.dart';
import 'package:day_i/features/auth/domain/params/register_params.dart';
import 'package:day_i/features/auth/domain/repository/repository.dart';

class RegisterUseCase {
  final Repository repository;
  RegisterUseCase({required this.repository});
  
  Future<Either<Failure, AuthEntity>> call(RegisterParams params) {
    return repository.register(params);
  }
}
