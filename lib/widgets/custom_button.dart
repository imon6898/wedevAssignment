import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final double width;
  final double height;
  final Color? textColor; // New optional parameter for custom text color

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.color,
    this.width = 308.68,
    this.height = 61.11,
    this.textColor, // Initialize optional parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: textColor ?? Colors.white, // Use textColor if provided, else default to white
          ),
        ),
      ),
    );
  }
}
