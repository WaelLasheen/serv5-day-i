import 'package:dartz/dartz.dart';
import 'package:day_i/core/networking/api_constants.dart';
import 'package:day_i/core/networking/i_api_service.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/core/utils/errors/server_failure.dart';
import '../models/pricing_plan_model.dart';
import '../models/plan_comparison_model.dart';

class PricingPlansRepo {
  final IApiService apiService;

  PricingPlansRepo(this.apiService);

  Future<Either<Failure, List<PricingPlanModel>>> fetchPricingPlans(String lang) async {
    try {
      final responseEither = await apiService.get('${ApiConstants.plans}?lang=$lang');
      
      return responseEither.fold(
        (failure) => Left(failure),
        (res) {
          final dataList = res.data['data'] as List<dynamic>? ?? [];
          final plans = List.generate(
            dataList.length,
            (index) => PricingPlanModel.fromJson(dataList[index], index: index),
          );
          return Right(plans);
        },
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, PlanComparisonModel>> fetchPlanComparisons(String lang) async {
    try {
      final responseEither = await apiService.get('${ApiConstants.planComparisons}?lang=$lang');
      
      return responseEither.fold(
        (failure) => Left(failure),
        (res) {
          final model = PlanComparisonModel.fromJson(res.data);
          return Right(model);
        },
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
