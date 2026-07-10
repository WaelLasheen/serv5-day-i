import '../models/order_details_model.dart';

abstract class OrderDetailsRemoteDataSource {
  Future<OrderDetailsModel> getOrderDetails(String orderId);
}

class OrderDetailsRemoteDataSourceImpl implements OrderDetailsRemoteDataSource {
  @override
  Future<OrderDetailsModel> getOrderDetails(String orderId) async {
    // Mocking a network delay
    await Future.delayed(const Duration(seconds: 1));

    // Returning mock data as requested
    return OrderDetailsModel(
      invoiceNumber: 'INV-2024-089#',
      invoiceDate: '12 مايو 2026',
      paymentTime: '2:45 مساءا',
      orderNumber: 'ORD-99210',
      paymentMethod: 'بطاقة ائتمان',
      status: 'مدفوعة',
      customerName: 'أحمد محمود الخالدي',
      customerEmail: 'examole@gmail.com',
      serviceName: 'إدارة حملة إعلانية',
      serviceCategory: 'التسويق الرقمي',
      executionDays: 12,
      servicePrice: 2500.0,
      taxAmount: 375.0,
      discountAmount: 250.0,
      discountCode: 'HUB20',
      finalTotal: 2625.0,
    );
  }
}
