import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/home/domain/entity/home_suggested_service_entity.dart';
import 'package:day_i/features/home/domain/repository/home_repository.dart';

class GetHomeSuggestedServicesUseCase {
  final HomeRepository repository;

  const GetHomeSuggestedServicesUseCase(this.repository);

  Future<Either<Failure, List<HomeSuggestedServiceEntity>>> call() async {
    return await repository.getSuggestedServices();
  }
}
