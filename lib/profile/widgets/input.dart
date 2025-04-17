import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String title;
  final String inputtext;
  const Input({super.key, required this.title, required this.inputtext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30.0,
        bottom: 18.0,
        right: 20.0,
        left: 20.0,
      ),
      child: TextFormField(
        initialValue: inputtext,
        decoration: InputDecoration(
          labelText: title,
          labelStyle: const TextStyle(
            color: Colors.green, // Change label text color
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: Colors.grey, // Default border color
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: Colors.green, // Border color when focused
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: Colors.grey, // Border color when not focused
              width: 1.0,
            ),
          ),
          suffixIcon: const Icon(
            Icons.check,
            color: Colors.green, // Change suffix icon color
          ),
        ),
      ),
    );
  }
}
