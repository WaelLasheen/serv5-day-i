import 'package:dartz/dartz.dart';
import 'package:day_i/core/networking/api_constants.dart';
import 'package:day_i/core/networking/i_api_service.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/auth/data/data_source/remote_data_source.dart';
import 'package:day_i/features/auth/data/model/auth_model.dart';
import 'package:day_i/features/auth/data/model/verify_model.dart';
import 'package:day_i/features/auth/domain/params/change_password_params.dart';
import 'package:day_i/features/auth/domain/params/login_params.dart';
import 'package:day_i/features/auth/domain/params/register_params.dart';
import 'package:day_i/features/auth/domain/params/send_otp_params.dart';
import 'package:day_i/features/auth/domain/params/verify_params.dart';
import 'package:dio/dio.dart';

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
      (failure) => Left(failure),
      (response) => Right(AuthModel.fromJson(response.data)),
    );
  }

  @override
  Future<Either<Failure, AuthModel>> register(RegisterParams params) async {
    final result = await _apiService.post(
      ApiConstants.register,
      data: params.toJson(),
    );

    return result.fold(
      (failure) => Left(failure),
      (response) => Right(AuthModel.fromJson(response.data)),
    );
  }

  @override
  Future<Either<Failure, void>> sendOtp(SendOtpParams params) async {
    final result = await _apiService.post(
      ApiConstants.sendOtp,
      data: params.toJson(),
    );

    return result.fold((failure) => Left(failure), (response) => Right(null));
  }

  @override
  Future<Either<Failure, VerifyModel>> verify(VerifyParams params) async {
    final result = await _apiService.post(
      ApiConstants.verify,
      data: params.toJson(),
    );

    return result.fold(
      (failure) => Left(failure),
      (response) => Right(VerifyModel.fromJson(response.data)),
    );
  }

  @override
  Future<Either<Failure, void>> changePassword(
    ChangePasswordParams params,
  ) async {
    final result = await _apiService.post(
      ApiConstants.changePassword,
      data: params.toJson(),
      options: Options(
        headers: {'Authorization': 'Bearer ${params.bearerToken}'},
      ),
    );

    return result.fold((failure) => Left(failure), (response) => Right(null));
  }
}
