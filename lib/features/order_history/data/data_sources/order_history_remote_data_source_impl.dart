import 'package:dartz/dartz.dart';
import 'package:day_i/core/networking/api_constants.dart';
import 'package:day_i/core/networking/i_api_service.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/order_history/data/data_sources/order_history_remote_data_source.dart';
import 'package:day_i/features/order_history/data/models/order_model.dart';
import 'package:day_i/features/order_history/data/models/order_stats_model.dart';
import 'package:day_i/features/order_history/domain/params/order_params.dart';

class OrderHistoryRemoteDataSourceImpl implements OrderHistoryRemoteDataSource {
  final IApiService _apiService;

  OrderHistoryRemoteDataSourceImpl({required IApiService apiService})
    : _apiService = apiService;

  @override
  Future<Either<Failure, List<OrderModel>>> getOrders(
    OrderParams params,
  ) async {
    final responseResult = await _apiService.get(
      ApiConstants.orders,
      queryParameters: params.toJson(),
    );

    responseResult.fold((failure) {}, (response) {});
    // mock data till server error fixed
    return Right(
      _getMockOrders(
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
    final responseResult = await _apiService.get(ApiConstants.orderStats);

    responseResult.fold((failure) {}, (response) {});
    return Right(_getMockStats());
  }

  List<OrderModel> _getMockOrders(
    String? search,
    String? status,
    String? employeeName,
    int? page,
    int? perPage,
  ) {
    // Generate some mock orders for visual correctness
    final allMocks = [
      const OrderModel(
        id: 1,
        code: "ORD-2451#",
        title: "إدارة حملة إعلانية - فيسبوك",
        date: "12 مارس 2026",
        status: "pending",
        budget: 12000.0,
        platform: "facebook",
        employeeName: "Ahmed",
      ),
      const OrderModel(
        id: 2,
        code: "ORD-2452#",
        title: "إدارة حملة إعلانية - انستجرام",
        date: "12 مارس 2026",
        status: "approved",
        budget: 12000.0,
        platform: "instagram",
        employeeName: "Mohamed Hassan",
      ),
      const OrderModel(
        id: 3,
        code: "ORD-2453#",
        title: "تحسين محركات البحث-SEO",
        date: "12 مارس 2026",
        status: "pending",
        budget: 12000.0,
        platform: "google",
        employeeName: "Ahmed",
      ),
      const OrderModel(
        id: 4,
        code: "ORD-2454#",
        title: "تصميم واجهات المستخدم",
        date: "13 مارس 2026",
        status: "late",
        budget: 15000.0,
        platform: "google",
        employeeName: "Mohamed Hassan",
      ),
      const OrderModel(
        id: 5,
        code: "ORD-2455#",
        title: "حملة بريد إلكتروني ترويجية",
        date: "14 مارس 2026",
        status: "approved",
        budget: 8000.0,
        platform: "facebook",
        employeeName: "Ali",
      ),
      const OrderModel(
        id: 6,
        code: "ORD-2456#",
        title: "إنتاج محتوى فيديو ترويجي",
        date: "15 مارس 2026",
        status: "pending",
        budget: 25000.0,
        platform: "instagram",
        employeeName: "Ali",
      ),
    ];

    var filtered = allMocks;

    // Filter by search
    if (search != null && search.isNotEmpty) {
      filtered = filtered
          .where(
            (o) =>
                o.title.toLowerCase().contains(search.toLowerCase()) ||
                o.code.toLowerCase().contains(search.toLowerCase()),
          )
          .toList();
    }

    // Filter by status
    if (status != null && status.isNotEmpty && status != "all") {
      filtered = filtered.where((o) => o.status == status).toList();
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

    // Pagination Mock
    final p = page ?? 1;
    final pp = perPage ?? 5;
    final startIndex = (p - 1) * pp;
    if (startIndex >= filtered.length) {
      return [];
    }
    final endIndex = startIndex + pp > filtered.length
        ? filtered.length
        : startIndex + pp;
    return filtered.sublist(startIndex, endIndex);
  }

  OrderStatsModel _getMockStats() {
    return const OrderStatsModel(
      all: 6,
      pending: 3,
      approved: 2,
      lateOrders: 1,
    );
  }
}
