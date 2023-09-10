import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/Components/Consts/constants.dart';
import 'package:note_app/Models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitialState());
  static NotesCubit get(context) => BlocProvider.of(context);

  showNotes() async {
    emit(NotesLoadingState());

    try {
      var notesBox = Hive.box<NoteModel>(noteBox);

      List<NoteModel> notes = notesBox.values.toList();
      emit(NotesSuccessState(notes));
    } catch (error) {
      emit(NotesErrorState(error.toString()));
    }
  }
}
