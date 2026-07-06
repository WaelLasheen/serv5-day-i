import 'package:day_i/features/services/domain/entity/service_entity.dart';

class MainServiceEntity {
  final int id;
  final String title;
  final String description;
  final List<ServiceEntity> services;

  MainServiceEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.services,
  });
}