import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/payment/domain/repositories/payment_repository.dart';

class GetPaymentSuccessDetailsUseCase {
  final PaymentRepository repository;

  GetPaymentSuccessDetailsUseCase({required this.repository});

  Future<Either<Failure, dynamic>> call({required String paymentId}) async {
    return await repository.getPaymentSuccessDetails(paymentId: paymentId);
  }
}
