import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/services/domain/entity/service_details_entity.dart';
import 'package:day_i/features/services/domain/repository/repository.dart';

class GetServiceDetailsUseCase {
  final ServiceRepository _repository;

  GetServiceDetailsUseCase({required ServiceRepository repository})
      : _repository = repository;

  Future<Either<Failure, ServiceDetailsEntity>> call(int id, String lang) async {
    return await _repository.getServiceDetails(id, lang);
  }
}
