part of 'add_notes_cubit.dart';

abstract class NotesStates {}

final class NotesInitialstate extends NotesStates {}

final class NotesLoadingstate extends NotesStates {}

final class NotesSuccessstate extends NotesStates {}

final class NotesErrorstate extends NotesStates {
  String error;
  NotesErrorstate(this.error);
}
