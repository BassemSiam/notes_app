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
        if (notes.isEmpty) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.menu, color: Colors.grey, size: 150),
              Text('No Notes Added',
                  style: TextStyle(color: Colors.grey, fontSize: 40)),
            ],
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: notes.length,
                separatorBuilder: (context, index) => const SizedBox(
                      height: 8,
                    ),
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: const Key('id'),
                    background: Container(
                      color: Colors.red,
                      child: const Icon(
                        Icons.cancel,
                        size: 50,
                      ),
                    ),
                    onDismissed: (direction) {
                      notes[index].delete();
                      NotesCubit.get(context).showNotes();

                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${notes[index].title} deleted')));
                    },
                    child: NoteItem(
                      notes: notes[index],
                    ),
                  );
                }),
          );
        }
      },
    );
  }
}
