import 'package:flutter/material.dart';
import 'package:note_app/Components/Consts/constants.dart';
import 'Custom_Notes_items.dart';

class NoteViweBody extends StatelessWidget {
  const NoteViweBody({super.key});
  final data = const [Colors.amber];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          CustomAppBar(
            title: 'Notes',
            icon: Icons.search,
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemCount: 10,
                separatorBuilder: (context, index) => SizedBox(
                  height: 8,
                ),
                itemBuilder: (context, index) {
                  return NoteItem();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 28),
        ),
        const Spacer(),
        Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.07),
                borderRadius: BorderRadius.circular(16)),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  icon,
                  size: 30,
                ))),
      ],
    );
  }
}

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
      decoration: BoxDecoration(),
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(primaryColor),
            shape: MaterialStatePropertyAll(
              ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(55),
              ),
            ),
          ),
          onPressed: onTap,
          child: isLoading
              ? CircularProgressIndicator(
                color: Colors.black,
              )
              : Text(
                  'Add',
                  style: TextStyle(fontSize: 22, color: Colors.black),
                )),
    );
  }
}
