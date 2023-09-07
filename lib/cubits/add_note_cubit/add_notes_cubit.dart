import 'package:bloc/bloc.dart';

part 'add_notes_state.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitialstate());
}
