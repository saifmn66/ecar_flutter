import 'package:e_car/login/screens/carVerifScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:toastification/toastification.dart';

class NumVerifyScreen extends StatefulWidget {
  const NumVerifyScreen({super.key});

  @override
  State<NumVerifyScreen> createState() => _NumVerifyScreenState();
}

class _NumVerifyScreenState extends State<NumVerifyScreen> {
  String trueCode = '2001'; // Mock correct code
  String _code = ''; // Variable to store the entered code
  bool _onEditing = true; // Tracks whether the user is editing the code

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Verification'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter OTP',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 76, 76, 76),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Enter the 4-digit code sent to your number',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(221, 96, 96, 96),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60.0),
            VerificationCode(
              underlineColor: const Color.fromARGB(0, 90, 228, 166),
              underlineUnfocusedColor: Colors.transparent,
              fillColor: const Color.fromARGB(37, 90, 228, 166),
              fullBorder: false,
              textStyle: const TextStyle(
                fontSize: 25.0,
                color: Color.fromARGB(255, 148, 148, 148),
              ),
              keyboardType: TextInputType.number,
              length: 4, // Length of the verification code
              cursorColor: const Color.fromARGB(
                255,
                96,
                96,
                96,
              ), // Cursor color
              onCompleted: (String value) {
                setState(() {
                  _code = value;
                });
              },
              onEditing: (bool value) {
                setState(() {
                  _onEditing = value;
                });
                if (!_onEditing) FocusScope.of(context).unfocus();
              },
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
              onPressed:
                  _code.isNotEmpty
                      ? () {
                        if (_code == trueCode) {
                          // Show success toast
                          toastification.show(
                            context: context,
                            type: ToastificationType.success,
                            icon: const Icon(Icons.check_circle),
                            style: ToastificationStyle.flat,
                            title: const Text('Phone verified successfully!'),
                            primaryColor: const Color.fromARGB(
                              255,
                              74,
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
                              builder: (context) => const CarVerifyScreen(),
                            ),
                          );
                        } else {
                          // Show error toast
                          toastification.show(
                            context: context,
                            type: ToastificationType.error,
                            icon: const Icon(Icons.error),
                            style: ToastificationStyle.flat,
                            title: const Text(
                              'Invalid code. Please try again.',
                            ),
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
                        }
                      }
                      : null, // Disable button if no code is entered
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5AE4A7),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 15.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Verify',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
