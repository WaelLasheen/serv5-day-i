import 'package:day_i/generated/l10n.dart';
import 'package:day_i/features/order_history/data/data_sources/shared_orders_store.dart';
import '../models/order_details_model.dart';

abstract class OrderDetailsRemoteDataSource {
  Future<OrderDetailsModel> getOrderDetails(String orderId);
}

class OrderDetailsRemoteDataSourceImpl implements OrderDetailsRemoteDataSource {
  @override
  Future<OrderDetailsModel> getOrderDetails(String orderId) async {
    final order = SharedOrdersStore.getOrderById(orderId);
    if (order == null) {
      throw Exception(S.current.noServicesAvailable);
    }

    final String code = order.code;
    final String title = order.title;
    final String category = order.category ?? '';
    final double price = order.budget;
    final String dateStr = order.date;
    final String statusStr = order.status;
    final int execDays = order.executionDays ?? 0;
    final int serviceId = order.serviceId ?? order.id;

    final double tax = price * 0.15;
    final double total = price + tax;

    return OrderDetailsModel(
      invoiceNumber: 'INV-$code',
      invoiceDate: dateStr,
      paymentTime: '',
      orderNumber: code,
      paymentMethod: '',
      status: statusStr,
      customerName: '',
      customerEmail: '',
      serviceName: title,
      serviceCategory: category,
      executionDays: execDays,
      servicePrice: price,
      taxAmount: tax,
      discountAmount: 0.0,
      discountCode: '',
      finalTotal: total,
      serviceId: serviceId,
    );
  }
}
