import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/order_history/domain/entities/order_stats_entity.dart';
import 'package:day_i/features/order_history/domain/repositories/order_history_repository.dart';

class GetOrderStatsUseCase {
  final OrderHistoryRepository repository;

  GetOrderStatsUseCase(this.repository);

  Future<Either<Failure, OrderStatsEntity>> call() {
    return repository.getOrderStats();
  }
}
