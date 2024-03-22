part of 'bottom_sheet_bloc.dart';

sealed class BottomSheetEvent extends Equatable {}

class ChangeDateNoteEvent extends BottomSheetEvent {
  final DateTime dateNote;

  ChangeDateNoteEvent(this.dateNote);

  @override
  List<Object> get props => [dateNote];
}

class AddImageEvent extends BottomSheetEvent {
  final String imagePath;

  AddImageEvent(this.imagePath);
  @override
  List<Object> get props => [imagePath];
}

class AddToDoEvent extends BottomSheetEvent {
  @override
  List<Object> get props => [];
}

class UpdateToDoEvent extends BottomSheetEvent {
  final int noteID;

  UpdateToDoEvent(this.noteID);
  @override
  List<Object> get props => [noteID];
}

class EditToDoEvent extends BottomSheetEvent {
  final int noteID;

  EditToDoEvent(this.noteID);

  @override
  List<Object> get props => [noteID];
}
