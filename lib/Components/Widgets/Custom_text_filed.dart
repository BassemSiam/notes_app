import 'package:flutter/material.dart';
import 'package:note_app/Components/Consts/constants.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {super.key,
      required this.hintText,
      this.maxLine = 1,
      this.onSaved,
      this.validate,
      this.controler});
      
  final String hintText;
  final int maxLine;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validate;
  final TextEditingController? controler;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controler,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'filed is requierd';
        } else {
          return null;
        }
      },
      onSaved: onSaved,
      maxLines: maxLine,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: primaryColor,
        ),
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
