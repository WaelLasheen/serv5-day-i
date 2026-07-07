import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/order_history/domain/entities/order_entity.dart';
import 'package:day_i/features/order_history/domain/entities/order_stats_entity.dart';
import 'package:day_i/features/order_history/domain/params/order_params.dart';

abstract class OrderHistoryRepository {
  Future<Either<Failure, List<OrderEntity>>> getOrders(OrderParams params);

  Future<Either<Failure, OrderStatsEntity>> getOrderStats();
}
