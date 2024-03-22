// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ToDo extends Equatable {
  final int id;
  final String title;
  final String subTitle;
  final String dateCreatedNote;
  final String dateDeadlineNote;
  final String imageNote;

  const ToDo({
    this.id = 0,
    this.title = '',
    this.subTitle = '',
    this.dateCreatedNote = '',
    this.dateDeadlineNote = '',
    this.imageNote = '',
  });

  @override
  List<Object> get props => [
        id,
        title,
        subTitle,
        dateCreatedNote,
        dateDeadlineNote,
        imageNote,
      ];
}
