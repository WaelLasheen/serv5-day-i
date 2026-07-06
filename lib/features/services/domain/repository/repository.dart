import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/services/domain/entity/main_service_entity.dart';

abstract class ServiceRepository {
  Future<Either<Failure, List<MainServiceEntity>>> getServices(String lang);
}