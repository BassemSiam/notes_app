import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitialState());
  static NotesCubit get(context) => BlocProvider.of(context);
}
