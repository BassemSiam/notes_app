import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/Components/Consts/constants.dart';
import 'package:note_app/Models/note_model.dart';

part 'add_notes_state.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitialstate());

  addNote(NoteModel note) async {
    emit(NotesLoadingstate());
    var notesBox = Hive.box<NoteModel>(noteBox);
    await notesBox.add(note).then((value) {
      print(value);
      emit(NotesSuccessstate());
    }).catchError((error) {
      emit(NotesErrorstate(error.toString()));
    });
  }
}
