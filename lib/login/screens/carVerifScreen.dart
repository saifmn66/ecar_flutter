import 'package:e_car/login/screens/helloScreen.dart';
import 'package:e_car/login/services/userService.dart';
import 'package:e_car/login/widgets/button.dart';
import 'package:e_car/login/widgets/dropDownWidget.dart';
import 'package:flutter/material.dart';
import 'package:e_car/login/models/userModel.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:toastification/toastification.dart';

class CarVerifyScreen extends StatefulWidget {
  final String Name;
  final String Email;
  final String Phone;
  final String Passwd;

  const CarVerifyScreen({
    super.key,
    required this.Name,
    required this.Email,
    required this.Phone,
    required this.Passwd,
  });

  @override
  State<CarVerifyScreen> createState() => _CarVerifyScreenState();
}

class _CarVerifyScreenState extends State<CarVerifyScreen> {
  final TextEditingController carModelController = TextEditingController();
  final TextEditingController identifierController = TextEditingController();
  final TextEditingController serialNumberController = TextEditingController();

  final UserController userService = UserController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Car Verification'), centerTitle: true),
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

                const Text(
                  "Car Model",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6F6F6F),
                  ),
                ),
                const SizedBox(height: 8.0),
                SearchDropdown(
                  onValueChanged: (value) {
                    carModelController.text = value.toString();
                  },
                ),
                const SizedBox(height: 12.0),

                const Text(
                  "Car Identifier",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6F6F6F),
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: identifierController,
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
                    hintText: "Enter your identifier",
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 148, 148, 148),
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),

                // Serial Number Input Field
                const Text(
                  "Serial Number",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6F6F6F),
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: serialNumberController,
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
                    hintText: "Enter your serial number",
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 148, 148, 148),
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),

                // Register Button
                isLoading
                    ? Center(
                      child: LoadingAnimationWidget.dotsTriangle(
                        size: 50,
                        color: const Color.fromARGB(255, 77, 224, 158),
                      ),
                    )
                    : CustomButton(
                      color: const Color(0xFF5AE4A7),
                      textColor: const Color.fromARGB(255, 255, 255, 255),
                      borderColor: const Color(0xFF5AE4A7),
                      text: "Register",
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });

                        try {
                          final car = Car(
                            carModel: carModelController.text.trim(),
                            carId: identifierController.text.trim(),
                            serialNumber: serialNumberController.text.trim(),
                            battery: 100,
                          );

                          final user = User(
                            phoneNumber: widget.Phone,
                            email: widget.Email,
                            userName: widget.Name,
                            cars: [car],
                            passwd: widget.Passwd,
                            role: 'User',
                          );

                          await userService.createUser(user);
                          toastification.show(
                            context: context,
                            type: ToastificationType.success,
                            style: ToastificationStyle.flat,
                            title: const Text('Account created successfully!'),
                            primaryColor: const Color.fromARGB(
                              255,
                              81,
                              222,
                              74,
                            ),
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            autoCloseDuration: const Duration(seconds: 5),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HelloScreen(),
                            ),
                          );
                        } catch (e) {
                          toastification.show(
                            context: context,
                            type: ToastificationType.error,
                            style: ToastificationStyle.flat,
                            title: const Text('Error!'),
                            primaryColor: const Color.fromARGB(
                              255,
                              222,
                              74,
                              74,
                            ),
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            autoCloseDuration: const Duration(seconds: 5),
                          );
                        } finally {
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
