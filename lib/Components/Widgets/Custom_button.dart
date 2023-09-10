import 'package:flutter/material.dart';
import 'package:note_app/Components/Consts/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, this.isLoading = false});
  final void Function() onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context)
          .size
          .width, // >> same like the double.infinty but has diffrent errors,
      height: 50,
      decoration: const BoxDecoration(),
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(primaryColor),
            shape: MaterialStatePropertyAll(
              ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(55),
              ),
            ),
          ),
          onPressed: onTap,
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.black,
                )
              : const Text(
                  'Add',
                  style: TextStyle(fontSize: 22, color: Colors.black),
                )),
    );
  }
}
