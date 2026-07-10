class OrderDetailsEntity {
  final String invoiceNumber;
  final String invoiceDate;
  final String paymentTime;
  final String orderNumber;
  final String paymentMethod;
  final String status;
  final String customerName;
  final String customerEmail;
  final String serviceName;
  final String serviceCategory;
  final int executionDays;
  final double servicePrice;
  final double taxAmount;
  final double discountAmount;
  final String discountCode;
  final double finalTotal;

  OrderDetailsEntity({
    required this.invoiceNumber,
    required this.invoiceDate,
    required this.paymentTime,
    required this.orderNumber,
    required this.paymentMethod,
    required this.status,
    required this.customerName,
    required this.customerEmail,
    required this.serviceName,
    required this.serviceCategory,
    required this.executionDays,
    required this.servicePrice,
    required this.taxAmount,
    required this.discountAmount,
    required this.discountCode,
    required this.finalTotal,
  });
}
