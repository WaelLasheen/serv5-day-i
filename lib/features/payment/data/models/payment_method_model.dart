import 'package:day_i/features/payment/domain/entities/payment_method_entity.dart';

class PaymentMethodModel extends PaymentMethodEntity {
  const PaymentMethodModel({
    required super.id,
    required super.name,
    super.code,
    super.icon,
    super.isActive,
  });

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodModel(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id']?.toString() ?? '0') ?? 0,
      name: json['name']?.toString() ?? json['title']?.toString() ?? '',
      code: json['code']?.toString() ?? json['type']?.toString(),
      icon: json['icon']?.toString() ?? json['image']?.toString(),
      isActive: json['is_active'] == true ||
          json['is_active'] == 1 ||
          json['status'] == 'active',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'icon': icon,
      'is_active': isActive,
    };
  }
}
