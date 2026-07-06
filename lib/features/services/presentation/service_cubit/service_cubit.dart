import 'package:day_i/features/services/domain/entity/main_service_entity.dart';
import 'package:day_i/features/services/domain/entity/service_entity.dart';
import 'package:day_i/features/services/domain/use_case/get_services_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
  final GetServicesUseCase _getServicesUseCase;
  ServiceCubit({required GetServicesUseCase getServicesUseCase})
    : _getServicesUseCase = getServicesUseCase,
      super(ServiceInitial());

  Future<void> getServices(String lang) async {
    // just to test till error in server solved
    emit(
      ServiceSuccess(
        services: [
          MainServiceEntity(
            id: 0,
            title: 'title',
            description: 'description',
            services: [
              ServiceEntity(
                id: 0,
                name: 'name',
                shortDescription: 'shortDescription',
                icon: 'icon',
                price: 200.00,
                slug: 'slug',
              ),
              ServiceEntity(
                id: 0,
                name: 'name',
                shortDescription: 'shortDescription',
                icon: 'icon',
                price: 200.00,
                slug: 'slug',
              ),
              ServiceEntity(
                id: 0,
                name: 'name',
                shortDescription: 'shortDescription',
                icon: 'icon',
                price: 200.00,
                slug: 'slug',
              ),
            ],
          ),
          MainServiceEntity(
            id: 0,
            title: 'title',
            description: 'description',
            services: [
              ServiceEntity(
                id: 0,
                name: 'name',
                shortDescription: 'shortDescription',
                icon: 'icon',
                price: 200.00,
                slug: 'slug',
              ),
              ServiceEntity(
                id: 0,
                name: 'name',
                shortDescription: 'shortDescription',
                icon: 'icon',
                price: 200.00,
                slug: 'slug',
              ),
              ServiceEntity(
                id: 0,
                name: 'name',
                shortDescription: 'shortDescription',
                icon: 'icon',
                price: 200.00,
                slug: 'slug',
              ),
            ],
          ),
          MainServiceEntity(
            id: 0,
            title: 'title',
            description: 'description',
            services: [
              ServiceEntity(
                id: 0,
                name: 'name',
                shortDescription: 'shortDescription',
                icon: 'icon',
                price: 200.00,
                slug: 'slug',
              ),
              ServiceEntity(
                id: 0,
                name: 'name',
                shortDescription: 'shortDescription',
                icon: 'icon',
                price: 200.00,
                slug: 'slug',
              ),
              ServiceEntity(
                id: 0,
                name: 'name',
                shortDescription: 'shortDescription',
                icon: 'icon',
                price: 200.00,
                slug: 'slug',
              ),
            ],
          ),
        ],
      ),
    );
    // emit(ServiceLoading());
    // final result = await _getServicesUseCase(lang);
    // result.fold(
    //   (failure) => emit(ServiceFailure(message: failure.message)),
    //   (services) => emit(ServiceSuccess(services: services)),
    // );
  }
}
