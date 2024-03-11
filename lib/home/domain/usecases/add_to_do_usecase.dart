// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app/core/error/failure.dart';
import 'package:to_do_app/core/usecase/base_usecase.dart';
import 'package:to_do_app/home/domain/repository/base_home_repository.dart';

class AddToDoUseCase extends BaseUseCase<int, AddToDoParameters> {
  final BaseHomeRepository baseHomeRepository;

  AddToDoUseCase(this.baseHomeRepository);

  @override
  Future<Either<Failure, int>> call(AddToDoParameters parameters) async {
    return await baseHomeRepository.addToDo(parameters);
  }
}

class AddToDoParameters extends Equatable {
  final String title;
  final String subTitle;
  final String dateCreatedNote;
  final String dateDeadlineNote;
  final String imageNote;

  const AddToDoParameters({
    required this.title,
    required this.subTitle,
    required this.dateCreatedNote,
    required this.dateDeadlineNote,
    required this.imageNote,
  });

  @override
  List<Object> get props => [
        title,
        subTitle,
        dateCreatedNote,
        dateDeadlineNote,
        imageNote,
      ];
}
