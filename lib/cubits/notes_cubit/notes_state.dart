part of 'notes_cubit.dart';

abstract class NotesStates {}

class NotesInitialState extends NotesStates {}

class NotesLoadingState extends NotesStates {}

class NotesSuccessState extends NotesStates {
  final List<NoteModel> notes;

  NotesSuccessState(this.notes);
}