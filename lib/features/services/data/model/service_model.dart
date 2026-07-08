import 'package:day_i/features/services/domain/entity/service_entity.dart';

class ServiceModel {
  final int id;
  final String name;
  final String shortDescription;
  final String icon;
  final double price;
  final String priceLabel;
  final String slug;

  ServiceModel({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.icon,
    required this.price,
    required this.priceLabel,
    required this.slug,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
    id: json['id'],
    name: json['name'] ?? "no name",
    shortDescription: json['short_description'] ?? "no short description",
    icon: json['icon'] ?? "no icon",
    price: json['price'] != null ? double.parse(json['price']) : 0.0,
    priceLabel: json['price_label'] ?? "no price label",
    slug: json['slug'] ?? "no slug",
  );

  ServiceEntity toEntity() => ServiceEntity(
    id: id,
    name: name,
    shortDescription: shortDescription,
    icon: icon,
    price: price,
    priceLabel: priceLabel,
    slug: slug,
  );
}
