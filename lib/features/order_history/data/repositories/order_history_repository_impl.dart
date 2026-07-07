import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/order_history/data/data_sources/order_history_remote_data_source.dart';
import 'package:day_i/features/order_history/domain/entities/order_entity.dart';
import 'package:day_i/features/order_history/domain/entities/order_stats_entity.dart';
import 'package:day_i/features/order_history/domain/params/order_params.dart';
import 'package:day_i/features/order_history/domain/repositories/order_history_repository.dart';

class OrderHistoryRepositoryImpl implements OrderHistoryRepository {
  final OrderHistoryRemoteDataSource remoteDataSource;

  OrderHistoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrders(
    OrderParams params,
  ) async {
    final result = await remoteDataSource.getOrders(params);

    return result.fold(
      (failure) => Left(failure),
      (orders) => Right(orders.map((order) => order.toEntity()).toList()),
    );
  }

  @override
  Future<Either<Failure, OrderStatsEntity>> getOrderStats() async {
    final result = await remoteDataSource.getOrderStats();

    return result.fold(
      (failure) => Left(failure),
      (stats) => Right(stats.toEntity()),
    );
  }
}
