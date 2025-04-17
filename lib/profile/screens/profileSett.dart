import 'package:e_car/profile/widgets/input.dart';
import 'package:flutter/material.dart';

class ProfilSsett extends StatelessWidget {
  const ProfilSsett({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Profile Settings",
                style: TextStyle(
                  fontSize: 23.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.green,
                ),
              ),
            ),
            Input(title: "First Name", inputtext: "input Text"),
            Input(title: "Last Name", inputtext: "input Text"),
            Input(title: "Phone Number", inputtext: "22 333 555"),
            Input(title: "Label Text", inputtext: "input Text"),
            Input(title: "Label Text", inputtext: "input Text"),
            Input(title: "Label Text", inputtext: "input Text"),
          ],
        ),
      ),
    );
  }
}
