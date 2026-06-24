import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/maps/domain/entities/place_entity.dart';
import 'package:day_i/features/maps/domain/repos/maps_repository.dart';

class SearchPlacesUseCase {
  final MapsRepository repository;

  SearchPlacesUseCase(this.repository);

  Future<Either<Failure, List<PlaceEntity>>> call(String query) {
    return repository.searchPlaces(query);
  }
}
