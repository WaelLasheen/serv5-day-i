import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/services/data/model/main_service_model.dart';
import 'package:day_i/features/services/data/model/service_details_model.dart';
import 'package:day_i/features/services/data/model/service_model.dart';

abstract class ServiceRemoteDataSource {
  Future<Either<Failure, List<MainServiceModel>>> getServices(String lang);
  Future<Either<Failure, ServiceDetailsModel>> getServiceDetails(int id, String lang);
  Future<Either<Failure, List<ServiceModel>>> getSuggestedServices(String lang);
}