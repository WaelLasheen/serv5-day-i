import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/auth/data/data_source/remote_data_source.dart';
import 'package:day_i/features/auth/domain/entity/auth_entity.dart';
import 'package:day_i/features/auth/domain/entity/verify_entity.dart';
import 'package:day_i/features/auth/domain/params/change_password_params.dart';
import 'package:day_i/features/auth/domain/params/login_params.dart';
import 'package:day_i/features/auth/domain/params/register_params.dart';
import 'package:day_i/features/auth/domain/params/send_otp_params.dart';
import 'package:day_i/features/auth/domain/params/verify_params.dart';
import 'package:day_i/features/auth/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;

  RepositoryImpl({required RemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;
  @override
  Future<Either<Failure, AuthEntity>> login(LoginParams params) async {
    final result = await _remoteDataSource.login(params);
    return result.fold(
      (failure) => Left(failure),
      (authModel) => Right(authModel.toEntity()),
    );
  }

  @override
  Future<Either<Failure, AuthEntity>> register(RegisterParams params) async {
    final result = await _remoteDataSource.register(params);
    return result.fold(
      (failure) => Left(failure),
      (authModel) => Right(authModel.toEntity()),
    );
  }

  @override
  Future<Either<Failure, void>> sendOtp(SendOtpParams params) async {
    final result = await _remoteDataSource.sendOtp(params);
    return result.fold((failure) => Left(failure), (_) => Right(null));
  }

  @override
  Future<Either<Failure, VerifyEntity>> verify(VerifyParams params) async {
    final result = await _remoteDataSource.verify(params);
    return result.fold(
      (failure) => Left(failure),
      (verifyModel) => Right(verifyModel.toEntity()),
    );
  }

  @override
  Future<Either<Failure, void>> changePassword(
    ChangePasswordParams params,
  ) async {
    final result = await _remoteDataSource.changePassword(params);
    return result.fold((failure) => Left(failure), (_) => Right(null));
  }
}
