import 'package:e_car/map/widgets/box.dart';
import 'package:e_car/map/widgets/card.dart';
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
                                const CustomCard(),
                                const CustomCard(),
                                const CustomCard(),
                                const SizedBox(
                                  height: 20,
                                )
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
}
