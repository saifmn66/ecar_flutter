import 'package:e_car/Home/home.dart';
import 'package:e_car/login/screens/logScreen.dart';
import 'package:e_car/login/services/tokenService.dart';
import 'package:e_car/login/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

Future<void> verifyToken() async {
  final tokenService = TokenService();
  await tokenService.decodeAndPrintToken();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> login(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text("Error"),
              content: const Text("Email and password cannot be empty."),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("OK"),
                ),
              ],
            ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:3000/user/login/'), // emulator 10.0.2.2
        headers: {'Content-Type': 'application/json'},
        body: '{"Email": "$email", "Passwd": "$password"}',
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final token = responseData['accessToken'];
        final tokenService = TokenService();
        await tokenService.saveToken(token);
        await verifyToken();

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: const Text("Login Failed"),
                content: Text("Error: ${response.body.toString()}"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("OK"),
                  ),
                ],
              ),
        );
      }
    } catch (e) {
      print("An error occurred: $e");
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text("Error"),
              content: Text("An error occurred: $e"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("OK"),
                ),
              ],
            ),
      );
    } finally {
      setState(() {
        isLoading = false; // Hide the loader
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sign in your account",
              style: TextStyle(
                fontSize: 27.0,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 63, 63, 63),
              ),
            ),
            const SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF6F6F6F),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  TextField(
                    controller: emailController,
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
                      hintText: "Enter your email",
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF6F6F6F),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(44, 90, 228, 134),
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
                      hintText: "Enter your password",
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40.0),
            isLoading
                ? const CircularProgressIndicator()
                : CustomButton(
                  color: const Color(0xFF5AE4A7),
                  textColor: const Color.fromARGB(255, 255, 255, 255),
                  borderColor: const Color(0xFF5AE4A7),
                  text: "Login",
                  onPressed: () => login(context),
                ),
            const SizedBox(height: 40.0),
            const Text(
              "or sign in with",
              style: TextStyle(fontSize: 18.0, color: Color(0xFF6f6f6f)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("images/google.png", width: 35.0, height: 35.0),
                  const SizedBox(width: 15.0),
                  Image.asset("images/facebook.png", width: 35.0, height: 35.0),
                ],
              ),
            ),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 18.0, color: Color(0xFF6f6f6f)),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LogScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    " Sign up",
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Color(0xFF5AE4A7),
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFF5AE4A7),
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
