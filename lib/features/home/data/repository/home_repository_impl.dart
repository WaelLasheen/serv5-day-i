import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/core/utils/errors/server_failure.dart';
import 'package:day_i/features/home/data/data_source/home_data_source.dart';
import 'package:day_i/features/home/domain/entity/home_category_entity.dart';
import 'package:day_i/features/home/domain/entity/home_suggested_service_entity.dart';
import 'package:day_i/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource dataSource;

  const HomeRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<HomeCategoryEntity>>> getCategories() async {
    try {
      final models = await dataSource.getCategories();
      return Right(models);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HomeSuggestedServiceEntity>>> getSuggestedServices() async {
    try {
      final models = await dataSource.getSuggestedServices();
      return Right(models);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
