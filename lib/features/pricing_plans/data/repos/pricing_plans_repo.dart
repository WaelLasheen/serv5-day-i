import 'package:dartz/dartz.dart';
import '../models/pricing_plan_model.dart';

class PricingPlansRepo {
  // دالة تجريبية لعمل محاكاة (Mock) لجلب البيانات من الـ API
  Future<Either<String, List<PricingPlanModel>>> fetchPricingPlans() async {
    try {
      // محاكاة تأخير الشبكة
      await Future.delayed(const Duration(seconds: 1));

      // إرجاع البيانات التجريبية الموجودة في الموديل
      final plans = PricingPlanModel.getMockPlans();
      return Right(plans);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
