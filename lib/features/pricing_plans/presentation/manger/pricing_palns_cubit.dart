import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:day_i/features/pricing_plans/presentation/manger/pricing_palns_state.dart';
import 'package:day_i/features/pricing_plans/data/repos/pricing_plans_repo.dart';

class PricingPlansCubit extends Cubit<PricingPlansState> {
  final PricingPlansRepo pricingPlansRepo;
  
  PricingPlansCubit(this.pricingPlansRepo) : super(PricingPlansInitial());

  Future<void> fetchPricingPlans({String lang = 'ar'}) async {
    emit(PricingPlansLoading());
    
    final plansResult = await pricingPlansRepo.fetchPricingPlans(lang);
    final comparisonResult = await pricingPlansRepo.fetchPlanComparisons(lang);

    plansResult.fold(
      (failure) {
        if (!isClosed) emit(PricingPlansFailure(failure.message));
      },
      (plans) {
        comparisonResult.fold(
          (failure) {
            if (!isClosed) emit(PricingPlansFailure(failure.message));
          },
          (comparisonModel) {
            if (!isClosed) emit(PricingPlansSuccess(plans, comparisonModel));
          },
        );
      },
    );
  }

  void selectPlan(int index) {
    if (state is PricingPlansSuccess) {
      final currentState = state as PricingPlansSuccess;
      emit(
        PricingPlansSuccess(
          currentState.pricingPlans, 
          currentState.comparisonModel,
          selectedIndex: index,
        ),
      );
    }
  }
}
