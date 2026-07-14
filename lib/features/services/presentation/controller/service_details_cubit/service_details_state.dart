import 'package:day_i/features/services/domain/entity/service_details_entity.dart';

abstract class ServiceDetailsState {}

class ServiceDetailsInitial extends ServiceDetailsState {}

class ServiceDetailsLoading extends ServiceDetailsState {}

class ServiceDetailsLoaded extends ServiceDetailsState {
  final ServiceDetailsEntity serviceDetails;

  ServiceDetailsLoaded(this.serviceDetails);
}

class ServiceDetailsError extends ServiceDetailsState {
  final String message;

  ServiceDetailsError(this.message);
}
