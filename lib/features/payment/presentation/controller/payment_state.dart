import 'package:day_i/features/payment/domain/entities/payment_method_entity.dart';
import 'package:equatable/equatable.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object?> get props => [];
}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentMethodsLoaded extends PaymentState {
  final List<PaymentMethodEntity> methods;

  const PaymentMethodsLoaded({required this.methods});

  @override
  List<Object?> get props => [methods];
}

class PaymentSuccessVerified extends PaymentState {
  final dynamic details;

  const PaymentSuccessVerified({required this.details});

  @override
  List<Object?> get props => [details];
}

class PaymentCancelledState extends PaymentState {
  final dynamic result;

  const PaymentCancelledState({required this.result});

  @override
  List<Object?> get props => [result];
}

class PaymentError extends PaymentState {
  final String message;

  const PaymentError({required this.message});

  @override
  List<Object?> get props => [message];
}
