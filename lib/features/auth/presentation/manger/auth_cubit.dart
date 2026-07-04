import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:day_i/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthCubit({required this.authRemoteDataSource}) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await authRemoteDataSource.login(email, password);
      emit(AuthSuccess(userModel: user));
    } catch (e) {
      String errorMessage = e.toString();
      if (errorMessage.startsWith('Exception: ')) {
        errorMessage = errorMessage.substring(11);
      }
      emit(AuthFailure(message: errorMessage));
    }
  }
}
