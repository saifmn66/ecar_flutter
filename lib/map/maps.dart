import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ChargingStationsMap extends StatefulWidget {
  const ChargingStationsMap({super.key});

  @override
  State<ChargingStationsMap> createState() => _ChargingStationsMapState();
}

class _ChargingStationsMapState extends State<ChargingStationsMap> {
  final List<LatLng> chargingStations = [
    LatLng(37.7749, -122.4194), // San Francisco
    LatLng(36.7749, -122.4194), // San Francisco
    LatLng(38.7749, -122.4194), // San Francisco
    LatLng(34.0522, -118.2437), // Los Angeles
    LatLng(40.7128, -74.0060), // New York
  ];

  final TextEditingController searchController = TextEditingController();
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(
                  37.7749,
                  -122.4194,
                ), // Default center (San Francisco)
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers:
                      chargingStations.map((station) {
                        return Marker(
                          point: station,
                          child: const Icon(
                            Icons.location_on,
                            color: Colors.green,
                            size: 50.0,
                          ),
                        );
                      }).toList(),
                ),
              ],
            ),
            Positioned(
              top: 16.0,
              left: 16.0,
              right: 16.0,
              child: Material(
                elevation: 4.0,
                borderRadius: BorderRadius.circular(12.0),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: "Search for a location...",
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        searchController.clear();
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
