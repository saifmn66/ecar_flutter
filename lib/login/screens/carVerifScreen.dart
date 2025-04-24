import 'package:e_car/login/widgets/dropDownWidget.dart';
import 'package:flutter/material.dart';

class CarVerifyScreen extends StatefulWidget {
  const CarVerifyScreen({super.key});

  @override
  State<CarVerifyScreen> createState() => _CarVerifyScreenState();
}

class _CarVerifyScreenState extends State<CarVerifyScreen> {
  // Define the TextEditingController
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Car Verification",
                  style: TextStyle(
                    fontSize: 27.0,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 63, 63, 63),
                  ),
                ),
                const SizedBox(height: 40.0),

                // Name Input Field
                const Text(
                  "Name",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6F6F6F),
                  ),
                ),
                const SizedBox(height: 8.0),
                SearchDropdown(),
                const SizedBox(height: 12.0),
                const Text(
                  "Name",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6F6F6F),
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(10, 90, 228, 166),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(36, 90, 228, 166),
                      ),
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(44, 90, 228, 134),
                    hintText: "Enter your Name",
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 148, 148, 148),
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
                const Text(
                  "Name",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6F6F6F),
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(10, 90, 228, 166),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(36, 90, 228, 166),
                      ),
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(44, 90, 228, 134),
                    hintText: "Enter your Name",
                    hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 148, 148, 148),
                        ),
                  ),
                ),
                const SizedBox(height: 12.0),
                const Text(
                  "Name",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6F6F6F),
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(10, 90, 228, 166),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(36, 90, 228, 166),
                      ),
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(44, 90, 228, 134),
                    hintText: "Enter your Name",
                    hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 148, 148, 148),
                        ),
                  ),
                ),
                const SizedBox(height: 12.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
