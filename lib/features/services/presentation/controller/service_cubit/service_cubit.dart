import 'package:day_i/features/services/domain/entity/main_service_entity.dart';
// import 'package:day_i/features/services/domain/entity/service_entity.dart';
import 'package:day_i/features/services/domain/use_case/get_services_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
  final GetServicesUseCase _getServicesUseCase;
  String? _currentLang;

  ServiceCubit({required GetServicesUseCase getServicesUseCase})
    : _getServicesUseCase = getServicesUseCase,
      super(ServiceInitial());

  Future<void> getServices(String lang, {bool forceRefresh = false}) async {
    if (!forceRefresh && state is ServiceSuccess && _currentLang == lang) {
      return;
    }
    _currentLang = lang;
    if (state is! ServiceSuccess) {
      emit(ServiceLoading());
    }
    final result = await _getServicesUseCase(lang);
    if (isClosed) return;
    result.fold(
      (failure) => emit(ServiceFailure(message: failure.message)),
      (services) => emit(ServiceSuccess(services: services)),
    );
  }
}
