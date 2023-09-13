import 'package:flutter/material.dart';
import 'package:note_app/Components/Widgets/Custom_app_bar_widget.dart';
import 'package:note_app/Components/Widgets/Custom_text_filed.dart';
import 'package:note_app/Models/note_model.dart';
import 'package:note_app/cubits/cubit/notes_cubit.dart';

class EditNoteScreen extends StatelessWidget {
  EditNoteScreen({super.key, required this.note});

  final NoteModel note;

  String? title, subTitle;

  TextEditingController titleControler = TextEditingController();
  TextEditingController subTitleControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            CustomAppBar(
              title: 'Edit Notes',
              icon: Icons.check,
              onPress: () {
                //with controler paramter

                // note.title = titleControler.text ?? note.title;
                // note.subTitle = subTitleControler.text ?? note.subTitle;

                //with onChange paramter
                note.title = title ?? note.title;
                note.subTitle = subTitle ?? note.subTitle;
                note.save();
                NotesCubit.get(context).showNotes();
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 40,
            ),
            CustomTextFiled(
              hintText: note.title,
              controler: titleControler,
              onchange: (value) {
                title = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFiled(
              hintText: note.subTitle,
              maxLine: 5,
              controler: subTitleControler,
              onchange: (value) {
                subTitle = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
