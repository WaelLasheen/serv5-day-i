import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/order_details_entity.dart';
import '../../domain/use_cases/get_order_details_use_case.dart';

abstract class OrderDetailsState {}

class OrderDetailsInitial extends OrderDetailsState {}

class OrderDetailsLoading extends OrderDetailsState {}

class OrderDetailsLoaded extends OrderDetailsState {
  final OrderDetailsEntity orderDetails;

  OrderDetailsLoaded(this.orderDetails);
}

class OrderDetailsError extends OrderDetailsState {
  final String message;

  OrderDetailsError(this.message);
}

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  final GetOrderDetailsUseCase getOrderDetailsUseCase;

  OrderDetailsCubit(this.getOrderDetailsUseCase) : super(OrderDetailsInitial());

  Future<void> getOrderDetails(String orderId) async {
    emit(OrderDetailsLoading());
    final result = await getOrderDetailsUseCase(orderId);
    result.fold(
      (failure) => emit(OrderDetailsError(failure.message)),
      (orderDetails) => emit(OrderDetailsLoaded(orderDetails)),
    );
  }
}
