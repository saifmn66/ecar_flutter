import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white, // White background for the card
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), // Lighter gray shadow
              spreadRadius: 1, // More subtle spread
              blurRadius: 7,
              offset: const Offset(0, 2), // Smaller vertical offset
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0), // Inner padding for content
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'images/borne.png',
                height: 180,
                width: 160,
              ), // Image on the left
              const SizedBox(width: 16), // Space between image and text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Data", style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Text("Data", style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Text("Data", style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Color(0xFF83EBBD),
                            ),
                          ),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Book Now',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
