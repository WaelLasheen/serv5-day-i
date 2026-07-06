import 'package:dartz/dartz.dart';
import 'package:day_i/core/networking/api_constants.dart';
import 'package:day_i/core/networking/i_api_service.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/services/data/data_source/remote_data_source.dart';
import 'package:day_i/features/services/data/model/main_service_model.dart';

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
}
