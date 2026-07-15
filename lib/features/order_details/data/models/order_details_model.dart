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
    super.serviceId,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailsModel(
      invoiceNumber: json['invoiceNumber']?.toString() ?? '',
      invoiceDate: json['invoiceDate']?.toString() ?? '',
      paymentTime: json['paymentTime']?.toString() ?? '',
      orderNumber: json['orderNumber']?.toString() ?? '',
      paymentMethod: json['paymentMethod']?.toString() ?? '',
      status: json['status']?.toString() ?? '',
      customerName: json['customerName']?.toString() ?? '',
      customerEmail: json['customerEmail']?.toString() ?? '',
      serviceName: json['serviceName']?.toString() ?? '',
      serviceCategory: json['serviceCategory']?.toString() ?? '',
      executionDays: json['executionDays'] is int
          ? json['executionDays']
          : int.tryParse(json['executionDays']?.toString() ?? '0') ?? 0,
      servicePrice: json['servicePrice'] is num
          ? (json['servicePrice'] as num).toDouble()
          : double.tryParse(json['servicePrice']?.toString() ?? '0') ?? 0.0,
      taxAmount: json['taxAmount'] is num
          ? (json['taxAmount'] as num).toDouble()
          : double.tryParse(json['taxAmount']?.toString() ?? '0') ?? 0.0,
      discountAmount: json['discountAmount'] is num
          ? (json['discountAmount'] as num).toDouble()
          : double.tryParse(json['discountAmount']?.toString() ?? '0') ?? 0.0,
      discountCode: json['discountCode']?.toString() ?? '',
      finalTotal: json['finalTotal'] is num
          ? (json['finalTotal'] as num).toDouble()
          : double.tryParse(json['finalTotal']?.toString() ?? '0') ?? 0.0,
      serviceId: json['serviceId'] is int
          ? json['serviceId']
          : int.tryParse(json['serviceId']?.toString() ?? json['service_id']?.toString() ?? ''),
    );
  }
}

