import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/order_history/data/models/order_model.dart';
import 'package:day_i/features/order_history/data/models/order_stats_model.dart';
import 'package:day_i/features/order_history/domain/params/order_params.dart';

abstract class OrderHistoryRemoteDataSource {
  Future<Either<Failure, List<OrderModel>>> getOrders(OrderParams params);

  Future<Either<Failure,OrderStatsModel>> getOrderStats();
}
