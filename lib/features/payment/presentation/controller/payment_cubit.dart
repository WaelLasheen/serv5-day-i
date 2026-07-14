import 'package:day_i/features/payment/domain/usecases/cancel_payment_use_case.dart';
import 'package:day_i/features/payment/domain/usecases/check_payment_success_use_case.dart';
import 'package:day_i/features/payment/domain/usecases/get_payment_methods_use_case.dart';
import 'package:day_i/features/payment/domain/usecases/get_payment_success_details_use_case.dart';
import 'package:day_i/features/payment/presentation/controller/payment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final GetPaymentMethodsUseCase getPaymentMethodsUseCase;
  final CheckPaymentSuccessUseCase checkPaymentSuccessUseCase;
  final CancelPaymentUseCase cancelPaymentUseCase;
  final GetPaymentSuccessDetailsUseCase getPaymentSuccessDetailsUseCase;

  PaymentCubit({
    required this.getPaymentMethodsUseCase,
    required this.checkPaymentSuccessUseCase,
    required this.cancelPaymentUseCase,
    required this.getPaymentSuccessDetailsUseCase,
  }) : super(PaymentInitial());

  Future<void> fetchPaymentMethods() async {
    emit(PaymentLoading());
    final result = await getPaymentMethodsUseCase.call();
    result.fold(
      (failure) {
        if (!isClosed) emit(PaymentError(message: failure.message));
      },
      (methods) {
        if (!isClosed) emit(PaymentMethodsLoaded(methods: methods));
      },
    );
  }

  Future<void> verifyPaymentSuccess({required String paymentId}) async {
    emit(PaymentLoading());
    final result = await checkPaymentSuccessUseCase.call(paymentId: paymentId);
    result.fold(
      (failure) {
        if (!isClosed) emit(PaymentError(message: failure.message));
      },
      (details) {
        if (!isClosed) emit(PaymentSuccessVerified(details: details));
      },
    );
  }

  Future<void> cancelPayment({required String paymentId}) async {
    emit(PaymentLoading());
    final result = await cancelPaymentUseCase.call(paymentId: paymentId);
    result.fold(
      (failure) {
        if (!isClosed) emit(PaymentError(message: failure.message));
      },
      (res) {
        if (!isClosed) emit(PaymentCancelledState(result: res));
      },
    );
  }

  Future<void> fetchSuccessDetails({required String paymentId}) async {
    emit(PaymentLoading());
    final result = await getPaymentSuccessDetailsUseCase.call(paymentId: paymentId);
    result.fold(
      (failure) {
        if (!isClosed) emit(PaymentError(message: failure.message));
      },
      (details) {
        if (!isClosed) emit(PaymentSuccessVerified(details: details));
      },
    );
  }
}
