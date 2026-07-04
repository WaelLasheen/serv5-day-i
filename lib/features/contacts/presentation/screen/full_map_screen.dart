import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class FullMapScreen extends StatelessWidget {
  final LatLng initialCenter;

  const FullMapScreen({super.key, required this.initialCenter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF121212)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: FlutterMap(
        options: MapOptions(initialCenter: initialCenter, initialZoom: 14.0),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.day_i',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: initialCenter,
                width: 40,
                height: 40,
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
    );
  }
}
