import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/auth/domain/params/change_password_params.dart';
import 'package:day_i/features/auth/domain/repository/repository.dart';

class ChangePasswordUseCase {
  final Repository repository;
  ChangePasswordUseCase({required this.repository});

  Future<Either<Failure, void>> call(ChangePasswordParams params) {
    return repository.changePassword(params);
  }
}
