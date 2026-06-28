import 'package:dartz/dartz.dart';
import 'package:day_i/core/networking/token_manager/token_manager.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/auth/data/data_source/remote_data_source.dart';
import 'package:day_i/features/auth/domain/entity/auth_entity.dart';
import 'package:day_i/features/auth/domain/params/login_params.dart';
import 'package:day_i/features/auth/domain/params/register_params.dart';
import 'package:day_i/features/auth/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final ITokenManager _tokenManager;

  RepositoryImpl({
    required RemoteDataSource remoteDataSource,
    required ITokenManager tokenManager,
  }) : _remoteDataSource = remoteDataSource,
       _tokenManager = tokenManager;

  @override
  Future<Either<Failure, AuthEntity>> login(LoginParams params) async {
    final result = await _remoteDataSource.login(params);
    return result.fold(
      (failure) {
        return Left(failure);
      },
      (authModel) async {
        await _tokenManager.saveAccessToken(authModel.token);
        return Right(authModel.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, AuthEntity>> register(RegisterParams params) async {
    final result = await _remoteDataSource.register(params);
    return result.fold(
      (failure) {
        return Left(failure);
      },
      (authModel) async {
        await _tokenManager.saveAccessToken(authModel.token);
        return Right(authModel.toEntity());
      },
    );
  }
}
