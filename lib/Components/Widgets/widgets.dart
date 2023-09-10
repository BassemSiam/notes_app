import 'package:flutter/material.dart';
import 'package:note_app/Components/Widgets/Custom_app_bar_widget.dart';
import 'package:note_app/Components/Widgets/NotesListViwe_widget.dart';

class NoteViweBody extends StatelessWidget {
  const NoteViweBody({super.key});
  final data = const [Colors.amber];
  @override
  Widget build(BuildContext context) {
    return const Padding(
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
          Expanded(child: NotesListViwe())
        ],
      ),
    );
  }
}
