import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:day_i/features/home/domain/use_case/get_home_categories_use_case.dart';
import 'package:day_i/features/home/domain/use_case/get_home_suggested_services_use_case.dart';
import 'package:day_i/features/home/presentation/controller/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHomeCategoriesUseCase getCategoriesUseCase;
  final GetHomeSuggestedServicesUseCase getSuggestedServicesUseCase;

  HomeCubit({
    required this.getCategoriesUseCase,
    required this.getSuggestedServicesUseCase,
  }) : super(const HomeInitial());

  Future<void> getHomeData() async {
    emit(const HomeLoading());
    final categoriesResult = await getCategoriesUseCase();
    final suggestedServicesResult = await getSuggestedServicesUseCase();

    categoriesResult.fold(
      (failure) => emit(HomeFailure(failure.message)),
      (categories) {
        suggestedServicesResult.fold(
          (failure) => emit(HomeFailure(failure.message)),
          (suggestedServices) {
            emit(HomeSuccess(
              categories: categories,
              suggestedServices: suggestedServices,
            ));
          },
        );
      },
    );
  }
}
