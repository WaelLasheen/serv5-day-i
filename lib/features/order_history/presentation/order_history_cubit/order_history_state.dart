import 'package:day_i/features/order_history/domain/params/order_params.dart';
import 'package:equatable/equatable.dart';
import 'package:day_i/features/order_history/domain/entities/order_entity.dart';
import 'package:day_i/features/order_history/domain/entities/order_stats_entity.dart';

abstract class OrderHistoryState extends Equatable {
  const OrderHistoryState();

  @override
  List<Object?> get props => [];
}

class OrderHistoryInitial extends OrderHistoryState {}

class OrderHistoryLoading extends OrderHistoryState {}

class OrderHistorySuccess extends OrderHistoryState {
  final List<OrderEntity> orders;
  final OrderStatsEntity stats;
  final OrderParams params;
  final bool isPaginationLoading;
  final bool hasReachedMax;

  const OrderHistorySuccess({
    required this.orders,
    required this.stats,
    required this.params,
    required this.hasReachedMax,
    this.isPaginationLoading = false,
  });

  OrderHistorySuccess copyWith({
    List<OrderEntity>? orders,
    OrderStatsEntity? stats,
    OrderParams? params,
    bool? hasReachedMax,
    bool? isPaginationLoading,
  }) {
    return OrderHistorySuccess(
      orders: orders ?? this.orders,
      stats: stats ?? this.stats,
      params: params ?? this.params,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isPaginationLoading: isPaginationLoading ?? this.isPaginationLoading,
    );
  }

  @override
  List<Object?> get props => [
    orders,
    stats,
    params,
    hasReachedMax,
    isPaginationLoading,
  ];
}

class OrderHistoryFailure extends OrderHistoryState {
  final String errorMessage;

  const OrderHistoryFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
