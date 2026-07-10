import 'package:dartz/dartz.dart';
import '../../../../core/utils/errors/failure.dart';
import '../../domain/entities/order_details_entity.dart';
import '../../domain/repositories/order_details_repository.dart';
import '../data_sources/order_details_remote_data_source.dart';
import '../../../../core/utils/errors/server_failure.dart';

class OrderDetailsRepositoryImpl implements OrderDetailsRepository {
  final OrderDetailsRemoteDataSource remoteDataSource;

  OrderDetailsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, OrderDetailsEntity>> getOrderDetails(String orderId) async {
    try {
      final result = await remoteDataSource.getOrderDetails(orderId);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
