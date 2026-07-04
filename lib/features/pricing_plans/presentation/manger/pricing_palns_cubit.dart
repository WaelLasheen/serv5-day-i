import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:day_i/features/pricing_plans/presentation/manger/pricing_palns_state.dart';
import 'package:day_i/features/pricing_plans/data/repos/pricing_plans_repo.dart';

class PricingPlansCubit extends Cubit<PricingPlansState> {
  final PricingPlansRepo pricingPlansRepo;
  PricingPlansCubit(this.pricingPlansRepo) : super(PricingPlansInitial());
  Future<void> fetchPricingPlans() async {
    emit(PricingPlansLoading());
    final result = await pricingPlansRepo.fetchPricingPlans();
    result.fold(
      (faliureMessage) => emit(PricingPlansFailure(faliureMessage)),
      (plans) => emit(PricingPlansSuccess(plans)),
    );
  }

  void selectPlan(int index) {
    if (state is PricingPlansSuccess) {
      final currentState = state as PricingPlansSuccess;
      emit(
        PricingPlansSuccess(currentState.pricingPlans, selectedIndex: index),
      );
    }
  }
}
