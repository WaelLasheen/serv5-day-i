import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/auth/domain/entity/verify_entity.dart';
import 'package:day_i/features/auth/domain/params/verify_params.dart';
import 'package:day_i/features/auth/domain/repository/repository.dart';

class VerifyUseCase {
  final Repository repository;
  VerifyUseCase({required this.repository});

  Future<Either<Failure, VerifyEntity>> call(VerifyParams params) {
    return repository.verify(params);
  }
}