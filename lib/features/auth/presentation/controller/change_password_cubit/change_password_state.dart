part of 'change_password_cubit.dart';

sealed class ChangePasswordState extends Equatable {
  const ChangePasswordState();

  @override
  List<Object> get props => [];
}

final class ChangePasswordInitial extends ChangePasswordState {}

final class ChangePasswordLoading extends ChangePasswordState {}

final class SendOtpSuccess extends ChangePasswordState {}

final class VerifySuccess extends ChangePasswordState {
  final VerifyEntity verifyEntity;
  const VerifySuccess({required this.verifyEntity});
}

final class ChangePasswordSuccess extends ChangePasswordState {}

final class ChangePasswordFailure extends ChangePasswordState {
  final String message;

  const ChangePasswordFailure({required this.message});
}
