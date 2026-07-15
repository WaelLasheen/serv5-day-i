import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/home/domain/entity/home_category_entity.dart';
import 'package:day_i/features/home/domain/repository/home_repository.dart';

class GetHomeCategoriesUseCase {
  final HomeRepository repository;

  const GetHomeCategoriesUseCase(this.repository);

  Future<Either<Failure, List<HomeCategoryEntity>>> call() async {
    return await repository.getCategories();
  }
}
