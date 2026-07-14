import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/payment/data/datasources/payment_remote_data_source.dart';
import 'package:day_i/features/payment/domain/entities/payment_method_entity.dart';
import 'package:day_i/features/payment/domain/repositories/payment_repository.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentRemoteDataSource remoteDataSource;

  PaymentRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<PaymentMethodEntity>>> getPaymentMethods() async {
    return await remoteDataSource.getPaymentMethods();
  }

  @override
  Future<Either<Failure, dynamic>> checkPaymentSuccess({required String paymentId}) async {
    return await remoteDataSource.checkPaymentSuccess(paymentId: paymentId);
  }

  @override
  Future<Either<Failure, dynamic>> cancelPayment({required String paymentId}) async {
    return await remoteDataSource.cancelPayment(paymentId: paymentId);
  }

  @override
  Future<Either<Failure, dynamic>> getPaymentSuccessDetails({required String paymentId}) async {
    return await remoteDataSource.getPaymentSuccessDetails(paymentId: paymentId);
  }
}
