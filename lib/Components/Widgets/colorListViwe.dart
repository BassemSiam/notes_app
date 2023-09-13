import 'package:flutter/material.dart';

class colorItem extends StatelessWidget {
  const colorItem({super.key, required this.isActive, required this.color});

  final bool isActive;

  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ?  CircleAvatar(
            backgroundColor: Colors.white,
            radius: 38,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 34,
            ),
          )
        :  CircleAvatar(
            backgroundColor: color,
            radius: 38,
          );
  }
}

class ColorListViwe extends StatefulWidget {
  const ColorListViwe({super.key});

  @override
  State<ColorListViwe> createState() => _ColorListViweState();
}

class _ColorListViweState extends State<ColorListViwe> {
  int currentIndex = 0;
  List<Color> colors = const [
    Color(0xff4281A4),
    Color(0xffeac435),
    Color(0xffe4572e),
    Color(0xff050517),
    Color(0xff453750)
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.separated(
        physics:const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(
          width: 12,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              setState(() {});
            },
            child: colorItem(
              color: colors[index],
              isActive: currentIndex == index,
            ),
          );
        },
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
