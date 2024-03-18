part of 'detail_bloc.dart';

class DetailState extends Equatable {
  final ButtonRequestState deleteNoteState;
  final String deleteNoteError;

  const DetailState({
    this.deleteNoteState = ButtonRequestState.normal,
    this.deleteNoteError = '',
  });

  DetailState copyWith({
    ButtonRequestState? deleteNoteState,
    String? deleteNoteError,
  }) {
    return DetailState(
      deleteNoteState: deleteNoteState ?? this.deleteNoteState,
      deleteNoteError: deleteNoteError ?? this.deleteNoteError,
    );
  }

  @override
  List<Object> get props => [deleteNoteState, deleteNoteError];
}
