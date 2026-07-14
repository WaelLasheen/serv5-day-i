import 'package:equatable/equatable.dart';

class PaymentMethodEntity extends Equatable {
  final int id;
  final String name;
  final String? code;
  final String? icon;
  final bool isActive;

  const PaymentMethodEntity({
    required this.id,
    required this.name,
    this.code,
    this.icon,
    this.isActive = true,
  });

  @override
  List<Object?> get props => [id, name, code, icon, isActive];
}
