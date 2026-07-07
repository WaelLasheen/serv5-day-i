part of 'service_cubit.dart';

sealed class ServiceState extends Equatable {
  const ServiceState();

  @override
  List<Object> get props => [];
}

final class ServiceInitial extends ServiceState {}

final class ServiceLoading extends ServiceState {}

final class ServiceSuccess extends ServiceState {
  final List<MainServiceEntity> services;
  const ServiceSuccess({required this.services});
  @override
  List<Object> get props => [services];
}

final class ServiceFailure extends ServiceState {
  final String message;
  const ServiceFailure({required this.message});
  @override
  List<Object> get props => [message];
}
