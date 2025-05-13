import 'package:e_car/login/screens/loginScreen.dart';
import 'package:e_car/login/screens/registerScreen.dart';
import 'package:e_car/login/widgets/button.dart';
import 'package:flutter/material.dart';

class LogScreen extends StatelessWidget {
  const LogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/logoo1.png",
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20.0),
            CustomButton(
              color: const Color(0xFF5AE4A7),
              textColor: const Color.fromARGB(255, 255, 255, 255),
              borderColor: const Color(0xFF75E6A4),
              text: "Login",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
            SizedBox(height: 20.0),
            CustomButton(
              color: const Color.fromARGB(255, 255, 255, 255),
              textColor: const Color(0xFF75E6A4),
              borderColor: const Color(0xFF75E6A4),
              text: "Register",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
