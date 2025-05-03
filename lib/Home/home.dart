import 'package:easy_pie_chart/easy_pie_chart.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final bgHeight = screenHeight * 0.41;
    final double val = 80;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 174, 235, 208),

                const Color.fromARGB(255, 255, 255, 255),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF5AE4A7),
                          const Color.fromARGB(0, 202, 240, 223),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    height: bgHeight,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, left: 20.0),
                        child: Text(
                          "Hi, User",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, right: 20.0),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: const Color.fromARGB(
                            158,
                            255,
                            255,
                            255,
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'images/car.png',
                              fit: BoxFit.cover,
                              width: 70,
                              height: 70,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    top: screenHeight * 0.1,
                    child: Image.asset(
                      'images/car.png',
                      fit: BoxFit.cover,
                      width: (screenWidth * 0.9),
                      height: 280,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .center, // Important for height alignment
                    children: [
                      // Left container (battery)
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: screenWidth * 0.47,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  textAlign: TextAlign.left,
                                  "Battery",
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 78, 77, 77),
                                  ),
                                ),
                                Text(
                                  "last updated: 2 days ago",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      EasyPieChart(
                                        children: [
                                          PieData(
                                            value: val,
                                            color:
                                                val > 50
                                                    ? const Color(0xFF5AE4A7)
                                                    : val > 20
                                                    ? const Color.fromARGB(
                                                      255,
                                                      226,
                                                      179,
                                                      60,
                                                    )
                                                    : const Color.fromARGB(
                                                      255,
                                                      228,
                                                      90,
                                                      90,
                                                    ),
                                          ),
                                          PieData(
                                            value: (100 - val),
                                            color: const Color.fromARGB(
                                              82,
                                              201,
                                              201,
                                              201,
                                            ),
                                          ),
                                        ],
                                        size: 70,
                                        pieType: PieType.crust,
                                        borderWidth: 10.0,
                                        borderEdge: StrokeCap.butt,
                                        showValue: false,
                                        centerText: "$val%",
                                        centerStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                            255,
                                            114,
                                            113,
                                            113,
                                          ),
                                        ),
                                        shouldAnimate: true,
                                        animateDuration: const Duration(
                                          seconds: 1,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "12 Km",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromARGB(
                                                255,
                                                24,
                                                24,
                                                24,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 5,
                                            ),
                                            child: Container(
                                              height: 1,
                                              width: 60,
                                              color: const Color.fromARGB(
                                                255,
                                                169,
                                                166,
                                                166,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "120 Kw",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromARGB(
                                                255,
                                                149,
                                                149,
                                                149,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "last updated: 2 days ago",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      // Right containers column - wrapped in SizedBox
                      SizedBox(
                        width: screenWidth * 0.47,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                width:
                                    double
                                        .infinity, // Take full width of SizedBox
                                color: const Color.fromARGB(255, 255, 255, 255),
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'images/mdi_map-marker-distance.png',
                                      width: 35,
                                      height: 35,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "1.345 km",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "Total Distance",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                width:
                                    double
                                        .infinity, // Take full width of SizedBox
                                color: const Color.fromARGB(255, 255, 255, 255),
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'images/cloud.png',
                                      width: 35,
                                      height: 35,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "1.345 km",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "Total Distance",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'images/Frame.png',
                    width: double.infinity,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
