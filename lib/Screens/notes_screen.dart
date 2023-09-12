import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Components/Widgets/Custom_button_sheet.dart';
import 'package:note_app/Components/Widgets/widgets.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const NoteViweBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            context: context,
            builder: (context) {
              return CustomBottomSheet();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
