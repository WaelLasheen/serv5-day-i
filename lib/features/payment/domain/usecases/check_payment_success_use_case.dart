import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/payment/domain/repositories/payment_repository.dart';

class CheckPaymentSuccessUseCase {
  final PaymentRepository repository;

  CheckPaymentSuccessUseCase({required this.repository});

  Future<Either<Failure, dynamic>> call({required String paymentId}) async {
    return await repository.checkPaymentSuccess(paymentId: paymentId);
  }
}
