import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Components/Widgets/Custom_Notes_items.dart';
import 'package:note_app/Models/note_model.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';

class NotesListViwe extends StatelessWidget {
  const NotesListViwe({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesStates>(
      builder: (context, state) {
        List<NoteModel> notes = NotesCubit.get(context).notes!;
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: notes.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 8,
            ),
            itemBuilder: (context, index) {
              return  NoteItem(
                notes: notes[index],
              );
            },
          ),
        );
      },
    );
  }
}
