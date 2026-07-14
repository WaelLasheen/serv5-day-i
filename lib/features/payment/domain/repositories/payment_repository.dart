import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/payment/domain/entities/payment_method_entity.dart';

abstract class PaymentRepository {
  Future<Either<Failure, List<PaymentMethodEntity>>> getPaymentMethods();
  Future<Either<Failure, dynamic>> checkPaymentSuccess({required String paymentId});
  Future<Either<Failure, dynamic>> cancelPayment({required String paymentId});
  Future<Either<Failure, dynamic>> getPaymentSuccessDetails({required String paymentId});
}
