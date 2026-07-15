import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/home/domain/entity/home_category_entity.dart';
import 'package:day_i/features/home/domain/entity/home_suggested_service_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<HomeCategoryEntity>>> getCategories();
  Future<Either<Failure, List<HomeSuggestedServiceEntity>>> getSuggestedServices();
}
