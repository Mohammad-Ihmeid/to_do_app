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
    required this.id,
    required this.title,
    required this.subTitle,
    required this.dateCreatedNote,
    required this.dateDeadlineNote,
    required this.imageNote,
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
