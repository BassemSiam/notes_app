import 'package:flutter/material.dart';
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
          CustomAppBar(),
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
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Notes',
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
                icon: const Icon(
                  Icons.search,
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
      padding: const EdgeInsets.symmetric(horizontal:  16),
      child: Column(
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
        ],
      ),
    );
  }
}