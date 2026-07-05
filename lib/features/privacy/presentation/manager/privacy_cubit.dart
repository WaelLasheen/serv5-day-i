import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:day_i/features/privacy/presentation/manager/privacy_state.dart';

class PrivacyCubit extends Cubit<PrivacyState> {
  PrivacyCubit() : super(const PrivacyState());

  void toggleShareData(bool value) {
    emit(state.copyWith(shareData: value));
  }

  void toggleImproveService(bool value) {
    emit(state.copyWith(improveService: value));
  }

  void toggleVisibilityManager(bool value) {
    emit(state.copyWith(visibilityManager: value));
  }

  void toggleVisibilityTeam(bool value) {
    emit(state.copyWith(visibilityTeam: value));
  }

  void toggleAlertNewLogin(bool value) {
    emit(state.copyWith(alertNewLogin: value));
  }

  void toggleAlertStatusChange(bool value) {
    emit(state.copyWith(alertStatusChange: value));
  }
}
