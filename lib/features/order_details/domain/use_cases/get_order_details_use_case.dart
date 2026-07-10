import 'package:dartz/dartz.dart';
import '../../../../core/utils/errors/failure.dart';
import '../entities/order_details_entity.dart';
import '../repositories/order_details_repository.dart';

class GetOrderDetailsUseCase {
  final OrderDetailsRepository repository;

  GetOrderDetailsUseCase(this.repository);

  Future<Either<Failure, OrderDetailsEntity>> call(String orderId) {
    return repository.getOrderDetails(orderId);
  }
}
