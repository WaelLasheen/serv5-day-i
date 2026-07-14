import 'package:dartz/dartz.dart';
import 'package:day_i/core/networking/api_constants.dart';
import 'package:day_i/core/networking/i_api_service.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/services/data/data_source/remote_data_source.dart';
import 'package:day_i/features/services/data/model/main_service_model.dart';
import 'package:day_i/features/services/data/model/service_details_model.dart';
import 'package:day_i/features/services/data/model/service_model.dart';

class ServiceRemoteDataSourceImpl implements ServiceRemoteDataSource {
  final IApiService _apiService;

  ServiceRemoteDataSourceImpl({required IApiService apiService})
    : _apiService = apiService;

  @override
  Future<Either<Failure, List<MainServiceModel>>> getServices(
    String lang,
  ) async {
    final result = await _apiService.get(
      ApiConstants.services,
      queryParameters: {'lang': lang},
    );
    return result.fold(
      (failure) => Left(failure),
      (response) => Right(
        (response.data['data'] as List)
            .map((e) => MainServiceModel.fromJson(e))
            .toList(),
      ),
    );
  }
  @override
  Future<Either<Failure, ServiceDetailsModel>> getServiceDetails(
    int id,
    String lang,
  ) async {
    final result = await _apiService.get(
      '${ApiConstants.baseURL}/mobile/service-details/$id',
      queryParameters: {'lang': lang},
    );
    return result.fold(
      (failure) => Left(failure),
      (response) => Right(ServiceDetailsModel.fromJson(response.data['data'])),
    );
  }
  @override
  Future<Either<Failure, List<ServiceModel>>> getSuggestedServices(
    String lang,
  ) async {
    final result = await _apiService.get(
      ApiConstants.homeServices,
      queryParameters: {'lang': lang},
    );
    return result.fold(
      (failure) => Left(failure),
      (response) => Right(
        (response.data['data'] as List)
            .map((e) => ServiceModel.fromJson(e))
            .toList(),
      ),
    );
  }
}
