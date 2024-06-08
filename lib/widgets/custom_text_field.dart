import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final IconData? suffixIcon;
  final VoidCallback? onPrefixIconPressed;
  final VoidCallback? onSuffixIconPressed;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.prefixIconPath,
    this.suffixIconPath,
    this.suffixIcon,
    this.onPrefixIconPressed,
    this.onSuffixIconPressed,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.suffixIconPath != null || widget.suffixIcon != null ? _obscureText : false,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            fontSize: 17.36,
            color: Color(0xFFA4A9AF),
          ),
          border: InputBorder.none,
          filled: true,
          fillColor: Color(0xFFFFFFFF),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(10),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: widget.prefixIconPath != null
              ? GestureDetector(
            onTap: widget.onPrefixIconPressed,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                widget.prefixIconPath!,
                width: 20,
                height: 16,
              ),
            ),
          )
              : null,
          suffixIcon: widget.suffixIconPath != null
              ? GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                widget.suffixIconPath!,
                width: 20,
                height: 16,
              ),
            ),
          )
              : widget.suffixIcon != null
              ? GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                widget.suffixIcon,
                size: 20,
              ),
            ),
          )
              : null,
        ),
      ),
    );
  }
}



TextStyle customTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w700,
  fontSize: 25,
  height: 29.3 / 25, // Line height divided by font size
  color: Color(0xFF000000),
);





class CustomTextFields extends StatefulWidget {
  final TextEditingController controller;
  final String? hedingText;
  final String hintText;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final IconData? suffixIcon;
  final VoidCallback? onPrefixIconPressed;
  final VoidCallback? onSuffixIconPressed;

  const CustomTextFields({
    Key? key,
    required this.controller,
    this.hedingText,
    required this.hintText,
    this.prefixIconPath,
    this.suffixIconPath,
    this.suffixIcon,
    this.onPrefixIconPressed,
    this.onSuffixIconPressed,
  }) : super(key: key);

  @override
  _CustomTextFieldsState createState() => _CustomTextFieldsState();
}

class _CustomTextFieldsState extends State<CustomTextFields> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.hedingText!,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontSize: 17.36,
              color: Color(0xFFA4A9AF),
            ),
          ),
          SizedBox(height: 5,),
          SizedBox(
            height: 40,
            child: TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 17.36,
                  color: Color(0xFFA4A9AF),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 10), // Set vertical content padding to 0
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFA4A9AF)),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: widget.prefixIconPath != null
                    ? GestureDetector(
                  onTap: widget.onPrefixIconPressed,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      widget.prefixIconPath!,
                      width: 20,
                      height: 16,
                    ),
                  ),
                )
                    : null,
                suffixIcon: widget.suffixIconPath != null
                    ? GestureDetector(
                  onTap: widget.onSuffixIconPressed,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      widget.suffixIconPath!,
                      width: 20,
                      height: 16,
                    ),
                  ),
                )
                    : widget.suffixIcon != null
                    ? GestureDetector(
                  onTap: widget.onSuffixIconPressed,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(
                      widget.suffixIcon,
                      size: 20,
                    ),
                  ),
                )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


