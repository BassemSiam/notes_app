import 'package:flutter/material.dart';
import 'package:note_app/Components/Consts/constants.dart';
import 'package:note_app/Components/Widgets/Custom_text_filed.dart';

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

class CustomBottomShet extends StatelessWidget {
  const CustomBottomShet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 32,
              ),
              CustomTextFiled(
                hintText: 'Title',
              ),
              SizedBox(
                height: 26,
              ),
              CustomTextFiled(
                hintText: 'Content',
                maxLine: 5,
              ),
              SizedBox(
                height: 25,
              ),
              CustomButton(),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

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
            onPressed: () {},
            child: Text(
              'Add',
              style: TextStyle(fontSize: 22, color: Colors.black),
            )));
  }
}
