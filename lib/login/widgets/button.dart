import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final Color borderColor;
  final String text;
  final VoidCallback onPressed; 

  const CustomButton({
    super.key,
    required this.color,
    required this.textColor,
    required this.borderColor,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final buttonWidth = (maxWidth > 600 ? 600 : maxWidth) * 0.85;

    return SizedBox(
      width: buttonWidth,
      child: TextButton(
        style: ButtonStyle(
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(vertical: 22), // Vertical padding only
          ),
          backgroundColor: WidgetStateProperty.all<Color>(color),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
              side: BorderSide(color: borderColor),
            ),
          ),
          foregroundColor: WidgetStateProperty.all<Color>(textColor),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}