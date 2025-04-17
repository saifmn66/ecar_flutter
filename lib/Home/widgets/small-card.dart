import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SmallCard extends StatelessWidget {
  final double width;
  final String lottie;
  final Widget content;

  const SmallCard({
    super.key,
    required this.width,
    required this.lottie,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        height: 200,
        width: width,
        color: const Color.fromARGB(17, 94, 94, 94),
        child: Stack(
          children: [
            Lottie.asset(
              lottie, // Your Lottie file path
              fit: BoxFit.contain,
              repeat: true,
              animate: true,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [content],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
