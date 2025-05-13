import 'package:e_car/login/screens/numVerifyScreen.dart';
import 'package:e_car/login/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var isChecked = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("")),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/logoo1.png",
                width: 110,
                height: 110,
                fit: BoxFit.contain,
              ),
              Text(
                "Sign up in your account",
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
                    Text(
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
                  ],
                ),
              ),
              SizedBox(height: 12.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
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
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 148, 148, 148),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Phone Number",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF6F6F6F),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextField(
                      controller: phoneController,
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
                        hintText: "Enter your phone number",
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 148, 148, 148),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
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
                        hintText: "Enter your password",
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 148, 148, 148),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 12.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      activeColor: const Color(0xFF5AE4A7),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text(
                      "I understood the terms & policy.",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF6F6F6F),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40.0),
              CustomButton(
                color: const Color(0xFF5AE4A7),
                textColor: const Color.fromARGB(255, 255, 255, 255),
                borderColor: const Color(0xFF5AE4A7),
                text: "Register",
                onPressed: () {
                  if (nameController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      phoneController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    toastification.show(
                      context: context,
                      type: ToastificationType.error,
                      style: ToastificationStyle.flat,
                      title: const Text('All fields are required!'),
                      primaryColor: const Color.fromARGB(255, 222, 74, 74),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      autoCloseDuration: const Duration(seconds: 5),
                    );
                    return;
                  }
                  if (!isChecked) {
                    toastification.show(
                      context: context,
                      type: ToastificationType.error,
                      style: ToastificationStyle.flat,
                      title: const Text('Please accept the terms & policy!'),
                      primaryColor: const Color.fromARGB(255, 222, 74, 74),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      autoCloseDuration: const Duration(seconds: 5),
                    );
                    return;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => NumVerifyScreen(
                            Name: nameController.text,
                            Email: emailController.text,
                            Phone: phoneController.text,
                            Passwd: passwordController.text,
                          ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20.0),
              const Text(
                "or sign up with",
                style: TextStyle(fontSize: 18.0, color: Color(0xFF6f6f6f)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("images/google.png", width: 35.0, height: 35.0),
                    const SizedBox(width: 15.0),
                    Image.asset(
                      "images/facebook.png",
                      width: 35.0,
                      height: 35.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
