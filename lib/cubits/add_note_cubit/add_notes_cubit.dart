import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/Components/Consts/constants.dart';
import 'package:note_app/Models/note_model.dart';

part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesStates> {
  AddNotesCubit() : super(AddNotesInitialstate());

  addNote(NoteModel note) async {
    emit(AddNotesLoadingstate());
    var notesBox = Hive.box<NoteModel>(noteBox);
    await notesBox.add(note).then((value) {
      print(value);
      emit(AddNotesSuccessstate());
    }).catchError((error) {
      emit(AddNotesErrorstate(error.toString()));
    });
  }
}
