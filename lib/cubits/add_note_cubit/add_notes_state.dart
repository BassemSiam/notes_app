part of 'add_notes_cubit.dart';

abstract class AddNotesStates {}

final class AddNotesInitialstate extends AddNotesStates {}

final class AddNotesLoadingstate extends AddNotesStates {}

final class AddNotesSuccessstate extends AddNotesStates {}

final class AddNotesErrorstate extends AddNotesStates {
  String error;
  AddNotesErrorstate(this.error);
}
