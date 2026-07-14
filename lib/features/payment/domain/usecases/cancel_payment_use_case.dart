import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/payment/domain/repositories/payment_repository.dart';

class CancelPaymentUseCase {
  final PaymentRepository repository;

  CancelPaymentUseCase({required this.repository});

  Future<Either<Failure, dynamic>> call({required String paymentId}) async {
    return await repository.cancelPayment(paymentId: paymentId);
  }
}
