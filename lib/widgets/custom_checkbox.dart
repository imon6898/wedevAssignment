import 'package:flutter/material.dart';

class CustomCheckboxRow extends StatelessWidget {
  final String labelText;
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  CustomCheckboxRow({
    required this.labelText,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => onChanged(!isChecked),
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isChecked ? Color(0xFFFF708A) : Colors.transparent, // Change color when checked
                border: Border.all(
                  color: Colors.black, // Border color
                  width: 1.25, // Border width
                ),
                borderRadius: BorderRadius.circular(4), // Rounded corners for the checkbox
              ),
              child: isChecked
                  ? Icon(
                Icons.check,
                size: 18,
                color: Colors.white, // Check color
              )
                  : null,
            ),
          ),
          SizedBox(width: 12), // Space between checkbox and text
          Container(
            width: 44,
            height: 23,
            alignment: Alignment.centerLeft,
            child: Text(
              labelText,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 15,
                height: 22.92 / 15, // Line height
                letterSpacing: 0.14,
                color: Color(0xFF000000),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
