import 'package:bloc/bloc.dart';
import 'package:day_i/features/auth/domain/entity/auth_entity.dart';
import 'package:day_i/features/auth/domain/params/login_params.dart';
import 'package:day_i/features/auth/domain/params/register_params.dart';
import 'package:day_i/features/auth/domain/use_case/login_use_case.dart';
import 'package:day_i/features/auth/domain/use_case/register_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late ValueNotifier<bool> _isTermsAcceptedNotifier;

  TextEditingController get nameController => _nameController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;
  ValueNotifier<bool> get isTermsAcceptedNotifier => _isTermsAcceptedNotifier;

  AuthCubit({
    required LoginUseCase loginUseCase,
    required RegisterUseCase registerUseCase,
  }) : _loginUseCase = loginUseCase,
       _registerUseCase = registerUseCase,
       super(AuthInitial()) {
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _isTermsAcceptedNotifier = ValueNotifier<bool>(false);
  }

  Future<void> login(LoginParams params) async {
    emit(AuthLoading());
    final result = await _loginUseCase.call(params);

    if (isClosed) return;
    result.fold(
      (failure) {
        emit(AuthError(message: failure.message));
      },
      (auth) {
        emit(AuthSuccess(auth: auth));
      },
    );
  }

  Future<void> register(RegisterParams params) async {
    emit(AuthLoading());
    final result = await _registerUseCase.call(params);

    if (isClosed) return;
    result.fold(
      (failure) {
        emit(AuthError(message: failure.message));
      },
      (auth) {
        emit(AuthSuccess(auth: auth));
      },
    );
  }

  @override
  Future<void> close() {
    disposeControllers();
    return super.close();
  }

  void disposeControllers() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _isTermsAcceptedNotifier.dispose();
  }

  void clearControllers() {
    _nameController.clear();
    _phoneController.clear();
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
    _isTermsAcceptedNotifier.value = false;
  }
}
