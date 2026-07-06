import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/services/domain/entity/main_service_entity.dart';
import 'package:day_i/features/services/domain/repository/repository.dart';

class GetServicesUseCase {
  final ServiceRepository _repository;
  GetServicesUseCase({required ServiceRepository repository})
    : _repository = repository;

  Future<Either<Failure, List<MainServiceEntity>>> call(String lang) async {
    return await _repository.getServices(lang);
  }
}
