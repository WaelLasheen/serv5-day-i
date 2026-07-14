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
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id']?.toString() ?? '0') ?? 0,
      code: json['code']?.toString() ?? json['order_code']?.toString() ?? '',
      title: json['title']?.toString() ?? json['service_name']?.toString() ?? '',
      date: json['date']?.toString() ?? json['created_at']?.toString() ?? '',
      status: json['status']?.toString() ?? 'pending',
      budget: json['budget'] is num
          ? (json['budget'] as num).toDouble()
          : double.tryParse(json['budget']?.toString() ?? '') ??
              (json['price'] is num
                  ? (json['price'] as num).toDouble()
                  : double.tryParse(json['price']?.toString() ?? '0') ?? 0.0),
      platform: json['platform']?.toString() ?? 'facebook',
      employeeName: json['employee_name']?.toString(),
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
