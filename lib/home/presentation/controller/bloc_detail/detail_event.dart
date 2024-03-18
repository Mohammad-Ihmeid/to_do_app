part of 'detail_bloc.dart';

sealed class DetailEvent extends Equatable {
  const DetailEvent();
}

class DeleteNoteEven extends DetailEvent {
  final int noteID;

  const DeleteNoteEven(this.noteID);
  @override
  List<Object> get props => [noteID];
}
