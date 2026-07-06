import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/order_history/domain/entities/order_entity.dart';
import 'package:day_i/features/order_history/domain/params/order_params.dart';
import 'package:day_i/features/order_history/domain/repositories/order_history_repository.dart';

class GetOrdersUseCase {
  final OrderHistoryRepository repository;

  GetOrdersUseCase(this.repository);

  Future<Either<Failure, List<OrderEntity>>> call(OrderParams params) {
    return repository.getOrders(params);
  }
}
