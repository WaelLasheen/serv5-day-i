import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/payment/domain/entities/payment_method_entity.dart';
import 'package:day_i/features/payment/domain/repositories/payment_repository.dart';

class GetPaymentMethodsUseCase {
  final PaymentRepository repository;

  GetPaymentMethodsUseCase({required this.repository});

  Future<Either<Failure, List<PaymentMethodEntity>>> call() async {
    return await repository.getPaymentMethods();
  }
}
