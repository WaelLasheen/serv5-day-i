import '../../domain/entities/order_details_entity.dart';

class OrderDetailsModel extends OrderDetailsEntity {
  OrderDetailsModel({
    required super.invoiceNumber,
    required super.invoiceDate,
    required super.paymentTime,
    required super.orderNumber,
    required super.paymentMethod,
    required super.status,
    required super.customerName,
    required super.customerEmail,
    required super.serviceName,
    required super.serviceCategory,
    required super.executionDays,
    required super.servicePrice,
    required super.taxAmount,
    required super.discountAmount,
    required super.discountCode,
    required super.finalTotal,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailsModel(
      invoiceNumber: json['invoiceNumber'] ?? '',
      invoiceDate: json['invoiceDate'] ?? '',
      paymentTime: json['paymentTime'] ?? '',
      orderNumber: json['orderNumber'] ?? '',
      paymentMethod: json['paymentMethod'] ?? '',
      status: json['status'] ?? '',
      customerName: json['customerName'] ?? '',
      customerEmail: json['customerEmail'] ?? '',
      serviceName: json['serviceName'] ?? '',
      serviceCategory: json['serviceCategory'] ?? '',
      executionDays: json['executionDays'] ?? 0,
      servicePrice: (json['servicePrice'] ?? 0.0).toDouble(),
      taxAmount: (json['taxAmount'] ?? 0.0).toDouble(),
      discountAmount: (json['discountAmount'] ?? 0.0).toDouble(),
      discountCode: json['discountCode'] ?? '',
      finalTotal: (json['finalTotal'] ?? 0.0).toDouble(),
    );
  }
}
