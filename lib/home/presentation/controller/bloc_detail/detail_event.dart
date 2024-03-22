part of 'detail_bloc.dart';

sealed class DetailEvent extends Equatable {
  const DetailEvent();
}

class GetDataNoteEvent extends DetailEvent {
  final int noteID;

  const GetDataNoteEvent(this.noteID);

  @override
  List<Object> get props => [noteID];
}

class DeleteNoteEven extends DetailEvent {
  final int noteID;

  const DeleteNoteEven(this.noteID);
  @override
  List<Object> get props => [noteID];
}
