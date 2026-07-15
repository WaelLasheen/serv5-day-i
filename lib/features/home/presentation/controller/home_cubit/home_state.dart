import 'package:day_i/features/home/domain/entity/home_category_entity.dart';
import 'package:day_i/features/home/domain/entity/home_suggested_service_entity.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeSuccess extends HomeState {
  final List<HomeCategoryEntity> categories;
  final List<HomeSuggestedServiceEntity> suggestedServices;

  const HomeSuccess({
    required this.categories,
    required this.suggestedServices,
  });
}

class HomeFailure extends HomeState {
  final String message;
  const HomeFailure(this.message);
}
