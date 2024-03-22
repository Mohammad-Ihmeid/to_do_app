part of 'detail_bloc.dart';

class DetailState extends Equatable {
  final ToDo toDoNote;
  final ButtonRequestState requestNoteState;
  final String requestNoteError;
  ///////////////////////////////////
  final ButtonRequestState deleteNoteState;
  final String deleteNoteError;

  const DetailState({
    this.toDoNote = const ToDo(),
    this.requestNoteState = ButtonRequestState.normal,
    this.requestNoteError = '',
    ///////////////////////////////////
    this.deleteNoteState = ButtonRequestState.normal,
    this.deleteNoteError = '',
  });

  DetailState copyWith({
    ToDo? toDoNote,
    ButtonRequestState? requestNoteState,
    String? requestNoteError,
    ///////////////////////////////////
    ButtonRequestState? deleteNoteState,
    String? deleteNoteError,
  }) {
    return DetailState(
      toDoNote: toDoNote ?? this.toDoNote,
      requestNoteState: requestNoteState ?? this.requestNoteState,
      requestNoteError: requestNoteError ?? this.requestNoteError,
      ///////////////////////////////////
      deleteNoteState: deleteNoteState ?? this.deleteNoteState,
      deleteNoteError: deleteNoteError ?? this.deleteNoteError,
    );
  }

  @override
  List<Object> get props => [
        toDoNote,
        requestNoteState,
        requestNoteError,
        deleteNoteState,
        deleteNoteError,
      ];
}
