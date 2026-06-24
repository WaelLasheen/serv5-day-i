import 'package:dartz/dartz.dart';
import 'package:day_i/core/networking/api_constants.dart';
import 'package:day_i/core/networking/i_api_service.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/core/utils/errors/server_failure.dart';
import 'package:day_i/features/maps/data/models/place_model.dart';
import 'package:dio/dio.dart';

abstract class MapsRemoteDataSource {
  Future<Either<Failure, List<PlaceModel>>> searchPlaces(String query);
}

class MapsRemoteDataSourceImpl implements MapsRemoteDataSource {
  final IApiService _apiService;

  MapsRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, List<PlaceModel>>> searchPlaces(String query) async {
    final response = await _apiService.get(
      ApiConstants.nominatimSearchURL,
      queryParameters: {'q': query, 'format': 'json', 'limit': 10},
      options: Options(
      headers: {
        'User-Agent': 'com.waellasheen.day_i', 
        'Accept': 'application/json',
      },),
    );

    return response.fold((failure) => Left(failure), (res) {
      if (res.data is List) {
        return Right(
          (res.data as List)
              .map((json) => PlaceModel.fromJson(json as Map<String, dynamic>))
              .toList(),
        );
      }
      return const Left(ServerFailure('Invalid response format'));
    });
  }
}
