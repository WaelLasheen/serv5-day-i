import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/maps/data/datasources/maps_remote_data_source.dart';
import 'package:day_i/features/maps/domain/entities/place_entity.dart';
import 'package:day_i/features/maps/domain/repos/maps_repository.dart';

class MapsRepositoryImpl implements MapsRepository {
  final MapsRemoteDataSource remoteDataSource;

  MapsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<PlaceEntity>>> searchPlaces(String query) async {
    final results = await remoteDataSource.searchPlaces(query);
    return results.fold(
      (failure) => Left(failure),
      (places) => Right(places.map((place) => place.toEntity()).toList()),
    );
  }
}
