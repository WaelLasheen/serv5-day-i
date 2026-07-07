import 'package:day_i/features/order_history/domain/params/order_params.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:day_i/features/order_history/domain/use_cases/get_orders_use_case.dart';
import 'package:day_i/features/order_history/domain/use_cases/get_order_stats_use_case.dart';
import 'package:day_i/features/order_history/presentation/order_history_cubit/order_history_state.dart';

class OrderHistoryCubit extends Cubit<OrderHistoryState> {
  final GetOrdersUseCase getOrdersUseCase;
  final GetOrderStatsUseCase getOrderStatsUseCase;

  OrderHistoryCubit({
    required this.getOrdersUseCase,
    required this.getOrderStatsUseCase,
  }) : super(OrderHistoryInitial());

  Future<void> fetchInitialOrders({OrderParams? param}) async {
    emit(OrderHistoryLoading());
    final params = param ?? OrderParams();
    final statsResult = await getOrderStatsUseCase();
    final ordersResult = await getOrdersUseCase(params);

    statsResult.fold((failure) => emit(OrderHistoryFailure(failure.message)), (
      stats,
    ) {
      ordersResult.fold(
        (failure) => emit(OrderHistoryFailure(failure.message)),
        (orders) {
          emit(
            OrderHistorySuccess(
              orders: orders,
              stats: stats,
              params: params,
              hasReachedMax: orders.length < params.perPage,
            ),
          );
        },
      );
    });
  }

  Future<void> filterByStatus(String status) async {
    final currentState = state;
    if (currentState is! OrderHistorySuccess) return;
    final params = OrderParams(
      status: status,
      search: currentState.params.search,
    );
    final ordersResult = await getOrdersUseCase(params);

    ordersResult.fold((failure) => emit(OrderHistoryFailure(failure.message)), (
      orders,
    ) {
      emit(
        currentState.copyWith(
          orders: orders,
          params: params,
          hasReachedMax: orders.length < params.perPage,
        ),
      );
    });
  }

  Future<void> searchOrders(String query) async {
    final currentState = state;
    if (currentState is! OrderHistorySuccess) return;

    final params = OrderParams(
      status: currentState.params.status,
      search: query,
    );

    final ordersResult = await getOrdersUseCase(params);
    ordersResult.fold((failure) => emit(OrderHistoryFailure(failure.message)), (
      orders,
    ) {
      emit(
        currentState.copyWith(
          orders: orders,
          params: params,
          hasReachedMax: orders.length < params.perPage,
        ),
      );
    });
  }

  Future<void> loadNextPage() async {
    final currentState = state;
    if (currentState is! OrderHistorySuccess) return;
    if (currentState.hasReachedMax || currentState.isPaginationLoading) return;

    emit(currentState.copyWith(isPaginationLoading: true));

    final nextPage = currentState.params.page + 1;
    final params = currentState.params.copyWith(page: nextPage);
    final ordersResult = await getOrdersUseCase(params);

    ordersResult.fold(
      (failure) {
        emit(currentState.copyWith(isPaginationLoading: false));
      },
      (newOrders) {
        if (newOrders.isEmpty) {
          emit(
            currentState.copyWith(
              hasReachedMax: true,
              isPaginationLoading: false,
            ),
          );
        } else {
          emit(
            currentState.copyWith(
              orders: [...currentState.orders, ...newOrders],
              params: params,
              hasReachedMax: newOrders.length < params.perPage,
              isPaginationLoading: false,
            ),
          );
        }
      },
    );
  }

  Future<void> refresh() async {
    final currentState = state;

    if (currentState is OrderHistorySuccess) {
      fetchInitialOrders(param: currentState.params.copyWith(page: 1));
    } else {
      fetchInitialOrders();
    }
  }
}
