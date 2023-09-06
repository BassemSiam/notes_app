import 'package:flutter/material.dart';
import 'package:note_app/Components/Consts/Colors.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({super.key, required this.hintText, this.maxLine = 1});
  final String hintText;
  final int maxLine;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLine,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: primaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: primaryColor),
        ),
      ),
    );
  }
}
