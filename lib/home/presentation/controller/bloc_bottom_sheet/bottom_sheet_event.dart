part of 'bottom_sheet_bloc.dart';

sealed class BottomSheetEvent extends Equatable {}

class ChangeDateNoteEvent extends BottomSheetEvent {
  final DateTime dateNote;

  ChangeDateNoteEvent(this.dateNote);

  @override
  List<Object> get props => [dateNote];
}
