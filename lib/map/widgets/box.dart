import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final String text;
  final String description;

  const Box({super.key, required this.text, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 120),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE5E5E5), width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.energy_savings_leaf, size: 20),
            const SizedBox(height: 10),
            Flexible(
              child: SingleChildScrollView(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(185, 0, 0, 0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromARGB(184, 74, 74, 74),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
