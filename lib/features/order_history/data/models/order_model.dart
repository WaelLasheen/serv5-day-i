import 'package:day_i/features/order_history/domain/entities/order_entity.dart';

class OrderModel  {
   final int id;
  final String code;
  final String title;
  final String date;
  final String status; // 'pending', 'approved', 'late'
  final double budget;
  final String platform; // 'facebook', 'instagram', 'google'
  final String? employeeName;

  const OrderModel({
    required this.id,
    required this.code,
    required this.title,
    required this.date,
    required this.status,
    required this.budget,
    required this.platform,
    this.employeeName,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] as int? ?? 0,
      code: json['code'] as String? ?? json['order_code'] as String? ?? '',
      title: json['title'] as String? ?? json['service_name'] as String? ?? '',
      date: json['date'] as String? ?? json['created_at'] as String? ?? '',
      status: json['status'] as String? ?? 'pending',
      budget: (json['budget'] as num?)?.toDouble() ?? (json['price'] as num?)?.toDouble() ?? 0.0,
      platform: json['platform'] as String? ?? 'facebook',
      employeeName: json['employee_name'] as String?,
    );
  }

  OrderEntity toEntity()=> OrderEntity(
    id: id,
    code: code,
    title: title,
    date: date,
    status: status,
    budget: budget,
    platform: platform,
    employeeName: employeeName,
  );
}
