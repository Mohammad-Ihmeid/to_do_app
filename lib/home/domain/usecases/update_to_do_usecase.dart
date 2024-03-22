import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app/core/error/failure.dart';
import 'package:to_do_app/core/usecase/base_usecase.dart';
import 'package:to_do_app/home/domain/repository/base_home_repository.dart';

class UpdateToDoUseCase extends BaseUseCase<int, UpdateToDoParameters> {
  final BaseHomeRepository homeRepository;

  UpdateToDoUseCase(this.homeRepository);

  @override
  Future<Either<Failure, int>> call(UpdateToDoParameters parameters) async {
    return await homeRepository.updateToDo(parameters);
  }
}

class UpdateToDoParameters extends Equatable {
  final int noteID;
  final String title;
  final String subTitle;
  final String dateDeadlineNote;
  final String imageNote;

  const UpdateToDoParameters({
    required this.noteID,
    required this.title,
    required this.subTitle,
    required this.dateDeadlineNote,
    required this.imageNote,
  });

  @override
  List<Object> get props => [
        noteID,
        title,
        subTitle,
        dateDeadlineNote,
        imageNote,
      ];
}
