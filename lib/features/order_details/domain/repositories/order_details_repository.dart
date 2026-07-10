import 'package:dartz/dartz.dart';
import '../../../../core/utils/errors/failure.dart';
import '../entities/order_details_entity.dart';

abstract class OrderDetailsRepository {
  Future<Either<Failure, OrderDetailsEntity>> getOrderDetails(String orderId);
}
