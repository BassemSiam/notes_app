import 'package:bloc/bloc.dart';
import 'package:note_app/Models/note_model.dart';

part 'add_notes_state.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitialstate());

  
  addNote(NoteModel noteModel){

  }
}
