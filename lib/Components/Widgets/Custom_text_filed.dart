import 'package:flutter/material.dart';
import 'package:note_app/Components/Consts/Colors.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField( 
      cursorColor: primaryColor,
      decoration: InputDecoration(
        hintText: 'Title',
        hintStyle: TextStyle(
          color: primaryColor
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white),
          

        ),
        enabledBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(10),
          borderSide:  BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: primaryColor),
        ),
      ),
    );
  }
}