import 'package:dartz/dartz.dart';
import 'package:day_i/core/di/di.dart';
import 'package:day_i/core/networking/i_api_service.dart';
import 'package:day_i/core/networking/interceptors/token_interceptor.dart';
import 'package:day_i/core/networking/token_manager/token_manager.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/core/utils/errors/server_failure.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'api_constants.dart';

class ApiServiceImpl implements IApiService {
  final Dio _dio = Dio();

  ApiServiceImpl() {
    _dio.options = BaseOptions(
      baseUrl: ApiConstants.baseURL,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 60 * 5),
    );
  }

  @override
  void initialize() {
    final tokenManager = getIt<ITokenManager>();
    _dio.interceptors.add(
      TokenInterceptor(dio: _dio, tokenManager: tokenManager),
    );

    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: false,
          responseBody: true,
          error: true,
          compact: true,
          maxWidth: 90, // keeps lines readable in consoles
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Response>> post(
    String path, {
    dynamic data,
    Options? options,
  }) async {
    try {
      return Right(await _dio.post(path, data: data, options: options));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Response>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return Right(await _dio.get(path, queryParameters: queryParameters));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Response>> put(
    String path, {
    dynamic data,
    Options? options,
  }) async {
    try {
      return Right(await _dio.put(path, data: data, options: options));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Response>> patch(
    String path, {
    dynamic data,
    Options? options,
  }) async {
    try {
      return Right(await _dio.patch(path, data: data, options: options));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Response>> delete(
    String path, {
    dynamic data,
    Options? options,
  }) async {
    try {
      return Right(await _dio.delete(path, data: data, options: options));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
