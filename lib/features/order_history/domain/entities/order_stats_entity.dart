class OrderStatsEntity {
  final int all;
  final int pending;
  final int approved;
  final int lateOrders;

  const OrderStatsEntity({
    required this.all,
    required this.pending,
    required this.approved,
    required this.lateOrders,
  });
}
