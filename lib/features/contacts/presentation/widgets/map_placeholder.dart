import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:day_i/features/contacts/presentation/screen/full_map_screen.dart';

class MapPlaceholder extends StatelessWidget {
  const MapPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    final centerPoint = const LatLng(24.7136, 46.6753); // Riyadh coordinates

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FullMapScreen(initialCenter: centerPoint),
          ),
        );
      },
      child: Container(
        height: 184.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFE9E9E9),
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24.r),
          child: AbsorbPointer(
            child: FlutterMap(
              options: MapOptions(
                initialCenter: centerPoint,
                initialZoom: 13.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.day_i',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: centerPoint,
                      width: 40.w,
                      height: 40.w,
                      child: const Icon(
                        Icons.location_on,
                        color: Color(0xFF4F46E5),
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
