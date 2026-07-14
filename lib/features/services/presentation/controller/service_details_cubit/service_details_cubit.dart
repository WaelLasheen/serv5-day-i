import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:day_i/features/services/domain/use_case/get_service_details_use_case.dart';
import 'package:day_i/features/services/presentation/controller/service_details_cubit/service_details_state.dart';

class ServiceDetailsCubit extends Cubit<ServiceDetailsState> {
  final GetServiceDetailsUseCase _getServiceDetailsUseCase;

  ServiceDetailsCubit(this._getServiceDetailsUseCase)
      : super(ServiceDetailsInitial());

  Future<void> getServiceDetails(int id, String lang) async {
    emit(ServiceDetailsLoading());
    final result = await _getServiceDetailsUseCase(id, lang);
    result.fold(
      (failure) => emit(ServiceDetailsError(failure.message)),
      (serviceDetails) => emit(ServiceDetailsLoaded(serviceDetails)),
    );
  }
}
