import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/services/domain/entity/main_service_entity.dart';
import 'package:day_i/features/services/domain/entity/service_details_entity.dart';

import 'package:day_i/features/services/domain/entity/service_entity.dart';

abstract class ServiceRepository {
  Future<Either<Failure, List<MainServiceEntity>>> getServices(String lang);
  Future<Either<Failure, ServiceDetailsEntity>> getServiceDetails(int id, String lang);
  Future<Either<Failure, List<ServiceEntity>>> getSuggestedServices(String lang);
}
