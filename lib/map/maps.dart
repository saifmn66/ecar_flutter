import 'package:dio/dio.dart';
import 'package:e_car/map/models/stationModel.dart';
import 'package:e_car/map/services/stationService.dart';
import 'package:e_car/map/widgets/box.dart';
import 'package:e_car/map/widgets/card.dart';
import 'package:e_car/map/widgets/charger.dart';
import 'package:e_car/map/widgets/piker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as dio;
import 'package:latlong2/latlong.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
  final StationService _stationService = StationService();
  late Future<List<Station>> _stationsFuture;

  @override
  void initState() {
    super.initState();
    _stationsFuture = _stationService.getStations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(37.7749, -122.4194), // San Francisco
                initialZoom: 10,
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
                            color: Color(0xFF5AE4A7),
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
            DraggableScrollableSheet(
              initialChildSize: 0.3,
              minChildSize: 0.3,
              maxChildSize: 0.8,
              snap: true,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: const Color(0xFF83EBBD),
                  ),
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 18.0,
                            right: 18.0,
                            left: 18.0,
                          ),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                            0.5,
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.local_gas_station,
                                            color: Colors.white,
                                            size: 13.0,
                                          ),
                                          const SizedBox(width: 6),
                                          Text(
                                            "EV Power Superfast Charging",
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                            0.4,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                "3.5 Km",
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                "Distance",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.white
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "25 Mins",
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                "Avg Time",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.white
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                          'images/Vector.png',
                                          width: 26,
                                          height: 20,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          "14.4 %",
                                          style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "20 Km Left",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white.withOpacity(0.5),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 35),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 22.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: FractionalTranslation(
                              translation: const Offset(0, 0.5),
                              child: Image.asset('images/smallcarr.png'),
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 22.0),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: FractionalTranslation(
                                      translation: const Offset(0, -0.5),
                                      child: Image.asset(
                                        'images/smallcarr.png',
                                      ),
                                    ),
                                  ),
                                ),
                                const FractionalTranslation(
                                  translation: Offset(-1.5, -1.5),
                                  child: Text(
                                    "Overviews",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                FractionalTranslation(
                                  translation: const Offset(0, -0.3),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xFFE5E5E5),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.pin_drop),
                                            const SizedBox(width: 15),
                                            Flexible(
                                              child: Text(
                                                "2102 Schuster Village Satterfieldshire, Wyoming 07072",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black
                                                      .withOpacity(0.7),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                        ),
                                        child: Box(
                                          text: "Valid Text",
                                          description: "Valid Description",
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                        ),
                                        child: Box(
                                          text: "Valid Text",
                                          description: "Valid Description",
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                        ),
                                        child: Box(
                                          text: "Valid Text",
                                          description: "Valid Description",
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                        ),
                                        child: Box(
                                          text: "Valid Text",
                                          description: "Valid Description",
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                        ),
                                        child: Box(
                                          text: "Valid Text",
                                          description: "Valid Description",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                FutureBuilder<List<Station>>(
                                  future: _stationsFuture,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                        child:
                                            LoadingAnimationWidget.dotsTriangle(
                                              size: 50,
                                              color: const Color.fromARGB(
                                                255,
                                                77,
                                                224,
                                                158,
                                              ),
                                            ),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Center(
                                        child: Text('Error: ${snapshot.error}'),
                                      );
                                    } else if (!snapshot.hasData ||
                                        snapshot.data!.isEmpty) {
                                      return const Center(
                                        child: Text('No stations found'),
                                      );
                                    } else {
                                      final stations = snapshot.data!;
                                      return ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: stations.length,
                                        itemBuilder: (context, index) {
                                          return CustomCard(
                                            ontap:
                                                () => {
                                                  _showModalBottomSheet(
                                                    context,
                                                    stations[index],
                                                  ),
                                                },
                                            stationName: stations[index].name,
                                          );
                                        },
                                      );
                                    }
                                  },
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context, Station station) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        final String stationName = station.name;
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              // Header section remains the same
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0, bottom: 8),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        stationName,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Socket Types",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(198, 0, 0, 0),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),

              // Main content with Expanded to prevent overflow
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Charger(),
                            Charger(),
                            Charger(),
                            Charger(),
                            Charger(),
                            Charger(),
                          ],
                        ),
                      ),
                      TimePicker(),
                      CustomCard(stationName: 'MachineA1', ontap: () {}),
                      CustomCard(stationName: 'MachineA2', ontap: () {}),
                      CustomCard(stationName: 'MachineA3', ontap: () {}),
                      SizedBox(height: 80), // Space for the bottom button
                    ],
                  ),
                ),
              ),

              // Fixed bottom button
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  color: Colors.white,
                  border: const Border(
                    top: BorderSide(color: Color(0xFFE0E0E0), width: 1.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                height: 80,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Appointment Summary",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF666666),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "May 15, 2023 • 2:30 PM",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF83EBBD),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Confirm',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
