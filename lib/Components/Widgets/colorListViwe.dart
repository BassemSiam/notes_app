import 'package:flutter/material.dart';

class colorItem extends StatelessWidget {
  const colorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Colors.amberAccent,
      radius: 38,
    );
  }
}

class ColorListViwe extends StatelessWidget {
  const ColorListViwe({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          width: 5,
        ),
        itemBuilder: (context, index) {
          return const colorItem();
        },
        itemCount: 10,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
