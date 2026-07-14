import 'package:dartz/dartz.dart';
import 'package:day_i/core/networking/api_constants.dart';
import 'package:day_i/core/networking/i_api_service.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/payment/data/models/payment_method_model.dart';

abstract class PaymentRemoteDataSource {
  Future<Either<Failure, List<PaymentMethodModel>>> getPaymentMethods();
  Future<Either<Failure, dynamic>> checkPaymentSuccess({required String paymentId});
  Future<Either<Failure, dynamic>> cancelPayment({required String paymentId});
  Future<Either<Failure, dynamic>> getPaymentSuccessDetails({required String paymentId});
}

class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  final IApiService apiService;

  PaymentRemoteDataSourceImpl({required this.apiService});

  @override
  Future<Either<Failure, List<PaymentMethodModel>>> getPaymentMethods() async {
    final result = await apiService.get(ApiConstants.paymentMethods);
    return result.fold(
      (failure) => Left(failure),
      (response) {
        final List data = response.data['data'] ?? response.data ?? [];
        return Right(data
            .map((json) => PaymentMethodModel.fromJson(json as Map<String, dynamic>))
            .toList());
      },
    );
  }

  @override
  Future<Either<Failure, dynamic>> checkPaymentSuccess({required String paymentId}) async {
    final result = await apiService.get(
      ApiConstants.paymentSuccess,
      queryParameters: {'payment_id': paymentId},
    );
    return result.fold(
      (failure) => Left(failure),
      (response) => Right(response.data),
    );
  }

  @override
  Future<Either<Failure, dynamic>> cancelPayment({required String paymentId}) async {
    final result = await apiService.get(
      ApiConstants.paymentCancel,
      queryParameters: {'payment_id': paymentId},
    );
    return result.fold(
      (failure) => Left(failure),
      (response) => Right(response.data),
    );
  }

  @override
  Future<Either<Failure, dynamic>> getPaymentSuccessDetails({required String paymentId}) async {
    final result = await apiService.get(
      '${ApiConstants.baseURL}/payments/$paymentId/success-details',
    );
    return result.fold(
      (failure) => Left(failure),
      (response) => Right(response.data),
    );
  }
}
