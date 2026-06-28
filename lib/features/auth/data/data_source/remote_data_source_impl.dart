import 'package:dartz/dartz.dart';
import 'package:day_i/core/networking/api_constants.dart';
import 'package:day_i/core/networking/i_api_service.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/auth/data/data_source/remote_data_source.dart';
import 'package:day_i/features/auth/data/model/auth_model.dart';
import 'package:day_i/features/auth/domain/params/login_params.dart';
import 'package:day_i/features/auth/domain/params/register_params.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final IApiService _apiService;

  RemoteDataSourceImpl({required IApiService apiService})
    : _apiService = apiService;

  @override
  Future<Either<Failure, AuthModel>> login(LoginParams params) async {
    final result = await _apiService.post(
      ApiConstants.login,
      data: params.toJson(),
    );

    return result.fold(
      (failure) {
        return Left(failure);
      },
      (response) {
        return Right(AuthModel.fromJson(response.data));
      },
    );
  }

  @override
  Future<Either<Failure, AuthModel>> register(RegisterParams params) async {
    final result = await _apiService.post(
      ApiConstants.register,
      data: params.toJson(),
    );
    
    return result.fold(
      (failure) {
        return Left(failure);
      },
      (response) {
        return Right(AuthModel.fromJson(response.data));
      },
    );
  }
}
