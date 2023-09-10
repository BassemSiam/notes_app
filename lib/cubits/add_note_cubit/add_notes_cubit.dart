import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/Components/Consts/constants.dart';
import 'package:note_app/Models/note_model.dart';

part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesStates> {
  AddNotesCubit() : super(AddNotesInitialState());
  static AddNotesCubit get(context) => BlocProvider.of(context);

  addNote(NoteModel note) async {
    emit(AddNotesLoadingState());

    var notesBox = Hive.box<NoteModel>(noteBox);
    await notesBox.add(note).then((value) {
      print("the value of adding : $value");
      emit(AddNotesSuccessState());
    }).catchError((error) {
      emit(AddNotesErrorState(error.toString()));
    });
  }
}
