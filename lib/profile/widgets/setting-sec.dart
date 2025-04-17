import 'package:flutter/material.dart';

class SettingSec extends StatelessWidget {
  final String title;
  final IconData iconData;
  const SettingSec({super.key, required this.title, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: const Color.fromARGB(56, 158, 158, 158), // Border color
            width: 1.0, // Border width
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          right: 18.0,
          left: 18.0,
          top: 18.0,
          bottom: 18.0,
        ),
        child: Row(
          children: [
            Icon(
              iconData,
              size: 37.0,
              color: const Color.fromARGB(194, 66, 190, 70),
            ),
            SizedBox(width: 20.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(255, 69, 68, 68),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
