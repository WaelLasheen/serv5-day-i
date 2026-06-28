import 'package:bloc/bloc.dart';
import 'package:day_i/features/auth/domain/entity/auth_entity.dart';
import 'package:day_i/features/auth/domain/params/login_params.dart';
import 'package:day_i/features/auth/domain/params/register_params.dart';
import 'package:day_i/features/auth/domain/use_case/login_use_case.dart';
import 'package:day_i/features/auth/domain/use_case/register_use_case.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;

  AuthCubit({
    required LoginUseCase loginUseCase,
    required RegisterUseCase registerUseCase,
  }) : _loginUseCase = loginUseCase,
       _registerUseCase = registerUseCase,
       super(AuthInitial());

  Future<void> login(LoginParams params) async {
    emit(AuthLoading());
    final result = await _loginUseCase.call(params);

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

    result.fold(
      (failure) {
        emit(AuthError(message: failure.message));
      },
      (auth) {
        emit(AuthSuccess(auth: auth));
      },
    );
  }
}
