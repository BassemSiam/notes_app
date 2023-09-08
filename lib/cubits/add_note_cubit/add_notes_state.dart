part of 'add_notes_cubit.dart';

abstract class AddNotesStates {}

final class AddNotesInitialState extends AddNotesStates {}

final class AddNotesLoadingState extends AddNotesStates {}

final class AddNotesSuccessState extends AddNotesStates {}

final class AddNotesErrorState extends AddNotesStates {
  String error;
  AddNotesErrorState(this.error);
}
