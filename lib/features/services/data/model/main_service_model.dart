import 'package:day_i/features/services/data/model/service_model.dart';
import 'package:day_i/features/services/domain/entity/main_service_entity.dart';

class MainServiceModel {
  final int id;
  final String title;
  final String description;
  final List<ServiceModel> services;

  MainServiceModel({
    required this.id,
    required this.title,
    required this.description,
    required this.services,
  });

  factory MainServiceModel.fromJson(Map<String, dynamic> json) =>
      MainServiceModel(
        id: json['id'],
        title: json['title'] ?? "no title",
        description: json['description'] ?? "no description",
        services: json['services'] != null
            ? (json['services'] as List<dynamic>)
                  .map((e) => ServiceModel.fromJson(e as Map<String, dynamic>))
                  .toList()
            : [],
      );

  MainServiceEntity toEntity() => MainServiceEntity(
    id: id,
    title: title,
    description: description,
    services: services.map((e) => e.toEntity()).toList(),
  );
}
