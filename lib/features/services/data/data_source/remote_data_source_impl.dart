import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:day_i/core/networking/api_constants.dart';
import 'package:day_i/core/networking/i_api_service.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/core/utils/errors/server_failure.dart';
import 'package:day_i/features/services/data/data_source/remote_data_source.dart';
import 'package:day_i/features/services/data/model/main_service_model.dart';
import 'package:day_i/features/services/data/model/service_details_model.dart';
import 'package:day_i/features/services/data/model/service_model.dart';
import 'package:day_i/generated/l10n.dart';

class ServiceRemoteDataSourceImpl implements ServiceRemoteDataSource {
  final IApiService _apiService;

  ServiceRemoteDataSourceImpl({required IApiService apiService})
    : _apiService = apiService;

  List<dynamic> _extractList(dynamic responseData) {
    if (responseData is List) {
      return responseData;
    }
    if (responseData is Map) {
      final data = responseData['data'] ??
          responseData['services'] ??
          responseData['categories'];
      if (data is List) {
        return data;
      }
    }
    return [];
  }

  Map<String, dynamic>? _extractMap(dynamic responseData) {
    if (responseData is Map<String, dynamic>) {
      if (responseData['data'] is Map<String, dynamic>) {
        return responseData['data'] as Map<String, dynamic>;
      }
      return responseData;
    }
    if (responseData is Map) {
      if (responseData['data'] is Map) {
        return Map<String, dynamic>.from(responseData['data']);
      }
      return Map<String, dynamic>.from(responseData);
    }
    return null;
  }

  @override
  Future<Either<Failure, List<MainServiceModel>>> getServices(
    String lang,
  ) async {
    try {
      final result = await _apiService.get(
        ApiConstants.services,
        queryParameters: {'lang': lang},
      ).timeout(const Duration(seconds: 4));
      return result.fold(
        (failure) => Left(failure),
        (response) {
          final data = _extractList(response.data);
          if (data.isEmpty) {
            return Left(ServerFailure(S.current.noServicesAvailable));
          }
          return Right(
            data.map((e) => MainServiceModel.fromJson(e)).toList(),
          );
        },
      );
    } on TimeoutException {
      return Left(ServerFailure(S.current.connectionTimeout));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ServiceDetailsModel>> getServiceDetails(
    int id,
    String lang,
  ) async {
    try {
      final result = await _apiService.get(
        '${ApiConstants.baseURL}/mobile/service-details/$id',
        queryParameters: {'lang': lang},
      ).timeout(const Duration(seconds: 4));
      return result.fold(
        (failure) => Left(failure),
        (response) {
          final data = _extractMap(response.data);
          if (data == null) {
            return Left(ServerFailure(S.current.noServicesAvailable));
          }
          return Right(ServiceDetailsModel.fromJson(data));
        },
      );
    } on TimeoutException {
      return Left(ServerFailure(S.current.connectionTimeout));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ServiceModel>>> getSuggestedServices(
    String lang,
  ) async {
    try {
      final result = await _apiService.get(
        ApiConstants.homeServices,
        queryParameters: {'lang': lang},
      ).timeout(const Duration(seconds: 4));
      return result.fold(
        (failure) => Left(failure),
        (response) {
          final data = _extractList(response.data);
          if (data.isEmpty) {
            return Left(ServerFailure(S.current.noServicesAvailable));
          }
          return Right(
            data.map((e) => ServiceModel.fromJson(e)).toList(),
          );
        },
      );
    } on TimeoutException {
      return Left(ServerFailure(S.current.connectionTimeout));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
