import 'package:flutter/material.dart';
import 'package:note_app/Components/Widgets/widgets.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const NoteViweBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return const CustomBottomShet();
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
