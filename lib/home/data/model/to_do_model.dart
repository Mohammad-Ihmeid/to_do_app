import 'package:to_do_app/home/domain/entities/to_do.dart';

class ToDoModel extends ToDo {
  const ToDoModel({
    required super.id,
    required super.title,
    required super.subTitle,
    required super.dateCreatedNote,
    required super.dateDeadlineNote,
    required super.imageNote,
  });

  factory ToDoModel.fromJson(Map<String, dynamic> json) => ToDoModel(
        id: json["ID"],
        title: json["Title"],
        subTitle: json["SubTitle"],
        dateCreatedNote: json["DateCreatedNote"],
        dateDeadlineNote: json["DateDeadlineNote"],
        imageNote: json["ImageNote"],
      );
}
