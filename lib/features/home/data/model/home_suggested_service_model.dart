import 'package:day_i/features/home/domain/entity/home_suggested_service_entity.dart';

class HomeSuggestedServiceModel extends HomeSuggestedServiceEntity {
  const HomeSuggestedServiceModel({
    required super.imageUrl,
    required super.tag,
    required super.title,
    required super.price,
    required super.duration,
    required super.rating,
  });

  factory HomeSuggestedServiceModel.fromJson(Map<String, dynamic> json) {
    return HomeSuggestedServiceModel(
      imageUrl: json['image'] ?? '',
      tag: json['category'] ?? '',
      title: json['title'] ?? json['name'] ?? '',
      price: json['price']?.toString() ?? '0',
      duration: json['duration']?.toString() ?? '',
      rating: int.tryParse(json['rating']?.toString() ?? '0') ?? (double.tryParse(json['rating']?.toString() ?? '0')?.toInt() ?? 0),
    );
  }
}
