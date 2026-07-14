import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:dio/dio.dart';

abstract class IApiService {
  Future<void> initialize();
  Future<Either<Failure, Response>> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
  Future<Either<Failure, Response>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
  Future<Either<Failure, Response>> put(
    String path, {
    dynamic data,
    Options? options,
  });
  Future<Either<Failure, Response>> patch(
    String path, {
    dynamic data,
    Options? options,
  });
  Future<Either<Failure, Response>> delete(
    String path, {
    dynamic data,
    Options? options,
  });

  Future<void> clearCookies();
}
