import 'package:equatable/equatable.dart';
import '../../data/models/pricing_plan_model.dart';
import '../../data/models/plan_comparison_model.dart';

abstract class PricingPlansState extends Equatable {
  const PricingPlansState();

  @override
  List<Object?> get props => [];
}

class PricingPlansInitial extends PricingPlansState {}

class PricingPlansLoading extends PricingPlansState {}

class PricingPlansSuccess extends PricingPlansState {
  final List<PricingPlanModel> pricingPlans;
  final PlanComparisonModel comparisonModel;
  final int selectedIndex;

  const PricingPlansSuccess(
    this.pricingPlans, 
    this.comparisonModel, 
    {this.selectedIndex = 0}
  );

  @override
  List<Object?> get props => [pricingPlans, comparisonModel, selectedIndex];
}

class PricingPlansFailure extends PricingPlansState {
  final String errMessage;

  const PricingPlansFailure(this.errMessage);

  @override
  List<Object?> get props => [errMessage];
}
