import 'package:bloc/bloc.dart';
import 'package:day_i/features/auth/domain/entity/verify_entity.dart';
import 'package:day_i/features/auth/domain/params/change_password_params.dart';
import 'package:day_i/features/auth/domain/params/send_otp_params.dart';
import 'package:day_i/features/auth/domain/params/verify_params.dart';
import 'package:day_i/features/auth/domain/use_case/change_password_use_case.dart';
import 'package:day_i/features/auth/domain/use_case/send_otp_use_case.dart';
import 'package:day_i/features/auth/domain/use_case/verify_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final SendOtpUseCase _sendOtpUseCase;
  final VerifyUseCase _verifyUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late ValueNotifier<bool> _isTermsAcceptedNotifier;

  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;
  ValueNotifier<bool> get isTermsAcceptedNotifier => _isTermsAcceptedNotifier;

  ChangePasswordCubit({
    required sendOtpUseCase,
    required verifyUseCase,
    required changePasswordUseCase,
  }) : _sendOtpUseCase = sendOtpUseCase,
       _verifyUseCase = verifyUseCase,
       _changePasswordUseCase = changePasswordUseCase,
       super(ChangePasswordInitial()) {
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _isTermsAcceptedNotifier = ValueNotifier<bool>(false);
  }

  Future<void> sendOtp(SendOtpParams params) async {
    emit(ChangePasswordLoading());
    final result = await _sendOtpUseCase.call(params);
    result.fold(
      (failure) => emit(ChangePasswordFailure(message: failure.message)),
      (_) => emit(SendOtpSuccess()),
    );
  }

  Future<void> verify(VerifyParams params) async {
    emit(ChangePasswordLoading());
    final result = await _verifyUseCase.call(params);
    result.fold(
      (failure) => emit(ChangePasswordFailure(message: failure.message)),
      (verify) => emit(VerifySuccess(verifyEntity: verify)),
    );
  }

  Future<void> changePassword(ChangePasswordParams params) async {
    emit(ChangePasswordLoading());
    final result = await _changePasswordUseCase.call(params);
    result.fold(
      (failure) => emit(ChangePasswordFailure(message: failure.message)),
      (_) => emit(ChangePasswordSuccess()),
    );
  }

  void disposeControllers() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _isTermsAcceptedNotifier.dispose();
  }

  void clearControllers() {
    _passwordController.clear();
    _confirmPasswordController.clear();
    _isTermsAcceptedNotifier.value = false;
  }
}
