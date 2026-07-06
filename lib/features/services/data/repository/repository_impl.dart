import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/services/data/data_source/remote_data_source.dart';
import 'package:day_i/features/services/domain/entity/main_service_entity.dart';
import 'package:day_i/features/services/domain/repository/repository.dart';

class ServiceRepositoryImpl implements ServiceRepository {
  final ServiceRemoteDataSource _remoteDataSource;
  ServiceRepositoryImpl({required ServiceRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, List<MainServiceEntity>>> getServices(
    String lang,
  ) async {
    final result = await _remoteDataSource.getServices(lang);
    return result.fold(
      (failure) => Left(failure),
      (mainServices) => Right(mainServices.map((e) => e.toEntity()).toList()),
    );
  }
}
