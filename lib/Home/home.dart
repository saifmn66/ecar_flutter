import 'package:easy_pie_chart/easy_pie_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final bgHeight = screenHeight * 0.45;
    final double val = 80;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF5AE4A7),
                        const Color.fromARGB(255, 255, 255, 255),
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
                    height: 300,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    width: screenWidth * 0.47,
                    color: const Color.fromARGB(0, 255, 36, 36),
                    padding: const EdgeInsets.all(10),
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
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: EasyPieChart(
                            children: [
                              PieData(
                                value: val,
                                color:
                                    val > 50
                                        ? Color(0xFF5AE4A7)
                                        : val > 20
                                        ? Color.fromARGB(255, 226, 179, 60)
                                        : Color.fromARGB(255, 228, 90, 90),
                              ),
                              PieData(
                                value: (100 - val),
                                color: const Color.fromARGB(82, 201, 201, 201),
                              ),
                            ],
                            // Optional parameters you can customize:
                            size: 70,
                            pieType: PieType.crust, // or PieType.filled
                            borderWidth: 10.0,
                            borderEdge: StrokeCap.butt,
                            showValue: false,
                            centerText: "$val%",
                            centerStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 114, 113, 113),
                            ),
                            shouldAnimate: true,
                            animateDuration: Duration(seconds: 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    width: screenWidth * 0.47,
                    color: const Color.fromARGB(255, 255, 36, 36),
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      textAlign: TextAlign.left,
                      "Battery",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 127, 127, 127),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
