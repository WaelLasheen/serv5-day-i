import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/maps/domain/entities/place_entity.dart';

abstract class MapsRepository {
  Future<Either<Failure, List<PlaceEntity>>> searchPlaces(String query);
}
