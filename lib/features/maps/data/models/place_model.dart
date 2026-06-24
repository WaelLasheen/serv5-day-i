import 'package:day_i/features/maps/domain/entities/place_entity.dart';

class PlaceModel {
  final String displayName;
  final double latitude;
  final double longitude;

  const PlaceModel({
    required this.displayName,
    required this.latitude,
    required this.longitude,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      displayName: json['display_name'] as String? ?? '',
      latitude: double.tryParse(json['lat']?.toString() ?? '') ?? 0.0,
      longitude: double.tryParse(json['lon']?.toString() ?? '') ?? 0.0,
    );
  }

  PlaceEntity toEntity() {
    return PlaceEntity(
      displayName: displayName,
      latitude: latitude,
      longitude: longitude,
    );
  }
}
