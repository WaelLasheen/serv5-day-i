import 'package:day_i/features/order_history/domain/entities/order_stats_entity.dart';

class OrderStatsModel {
  final int all;
  final int pending;
  final int approved;
  final int lateOrders;

  const OrderStatsModel({
    required this.all,
    required this.pending,
    required this.approved,
    required this.lateOrders,
  });

  factory OrderStatsModel.fromJson(Map<String, dynamic> json) {
    return OrderStatsModel(
      all: json['all'] as int? ?? json['all_count'] as int? ?? 0,
      pending: json['pending'] as int? ?? json['pending_count'] as int? ?? 0,
      approved: json['approved'] as int? ?? json['approved_count'] as int? ?? 0,
      lateOrders:
          json['late'] as int? ??
          json['late_count'] as int? ??
          json['lateOrders'] as int? ??
          0,
    );
  }
  OrderStatsEntity toEntity() => OrderStatsEntity(
    all: all,
    pending: pending,
    approved: approved,
    lateOrders: lateOrders,
  );
}
