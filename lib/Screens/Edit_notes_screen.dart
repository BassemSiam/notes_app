import 'package:flutter/material.dart';
import 'package:note_app/Components/Widgets/Custom_text_filed.dart';

import '../Components/Widgets/widgets.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            CustomAppBar(
              title: 'Edit Notes',
              icon: Icons.check,
            ),
            SizedBox(
              height: 40,
            ),
            CustomTextFiled(hintText: 'Title'),
            SizedBox(
              height: 20,
            ),
            CustomTextFiled(hintText: 'Content',maxLine: 5),
          ],
        ),
      ),
    );
  }
}
