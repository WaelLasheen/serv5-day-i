import 'package:dartz/dartz.dart';
import 'package:day_i/core/networking/i_api_service.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/order_history/data/data_sources/order_history_remote_data_source.dart';
import 'package:day_i/features/order_history/data/models/order_model.dart';
import 'package:day_i/features/order_history/data/models/order_stats_model.dart';
import 'package:day_i/features/order_history/data/data_sources/shared_orders_store.dart';
import 'package:day_i/features/order_history/domain/params/order_params.dart';

class OrderHistoryRemoteDataSourceImpl implements OrderHistoryRemoteDataSource {
  // ignore: unused_field
  final IApiService _apiService;

  OrderHistoryRemoteDataSourceImpl({required IApiService apiService})
    : _apiService = apiService;

  @override
  Future<Either<Failure, List<OrderModel>>> getOrders(
    OrderParams params,
  ) async {
    return Right(
      _getOrdersFromStore(
        params.search,
        params.status,
        params.employeeName,
        params.page,
        params.perPage,
      ),
    );
  }

  @override
  Future<Either<Failure, OrderStatsModel>> getOrderStats() async {
    return Right(_getStatsFromStore());
  }

  List<OrderModel> _getOrdersFromStore(
    String? search,
    String? status,
    String? employeeName,
    int? page,
    int? perPage,
  ) {
    var filtered = SharedOrdersStore.orders;

    // Filter by search
    if (search != null && search.trim().isNotEmpty) {
      filtered = filtered
          .where(
            (o) =>
                o.title.toLowerCase().contains(search.trim().toLowerCase()) ||
                o.code.toLowerCase().contains(search.trim().toLowerCase()) ||
                (o.category != null && o.category!.toLowerCase().contains(search.trim().toLowerCase())),
          )
          .toList();
    }

    // Filter by status
    if (status != null && status.isNotEmpty && status != "all") {
      filtered = filtered.where((o) => o.status.toLowerCase() == status.toLowerCase()).toList();
    }

    // Filter by employee
    if (employeeName != null && employeeName.isNotEmpty) {
      filtered = filtered
          .where(
            (o) =>
                o.employeeName != null &&
                o.employeeName!.toLowerCase().contains(
                  employeeName.toLowerCase(),
                ),
          )
          .toList();
    }

    // Pagination
    final p = page ?? 1;
    final pp = perPage ?? 10;
    final startIndex = (p - 1) * pp;
    if (startIndex >= filtered.length) {
      return [];
    }
    final endIndex = startIndex + pp > filtered.length
        ? filtered.length
        : startIndex + pp;
    return filtered.sublist(startIndex, endIndex);
  }

  OrderStatsModel _getStatsFromStore() {
    final all = SharedOrdersStore.orders.length;
    final pending = SharedOrdersStore.orders.where((o) => o.status.toLowerCase() == 'pending').length;
    final approved = SharedOrdersStore.orders.where((o) => o.status.toLowerCase() == 'approved' || o.status.toLowerCase() == 'completed').length;
    final lateOrders = SharedOrdersStore.orders.where((o) => o.status.toLowerCase() == 'late').length;

    return OrderStatsModel(
      all: all,
      pending: pending,
      approved: approved,
      lateOrders: lateOrders,
    );
  }
}

