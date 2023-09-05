import 'package:flutter/material.dart';
import 'package:note_app/Components/Widgets/widgets.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const NoteViweBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
