import 'package:day_i/generated/l10n.dart';
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
      invoiceDate: S.current.mockOrderDate1,
      paymentTime: '2:45 PM',
      orderNumber: 'ORD-99210',
      paymentMethod: S.current.mockPaymentCreditCard,
      status: S.current.mockStatusPaid,
      customerName: S.current.mockCustomerName,
      customerEmail: 'example@gmail.com',
      serviceName: S.current.mockServiceAdCampaign,
      serviceCategory: S.current.mockServiceDigitalMarketing,
      executionDays: 12,
      servicePrice: 2500.0,
      taxAmount: 375.0,
      discountAmount: 250.0,
      discountCode: 'HUB20',
      finalTotal: 2625.0,
    );
  }
}
