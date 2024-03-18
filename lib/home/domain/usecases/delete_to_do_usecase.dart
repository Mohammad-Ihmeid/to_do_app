import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app/core/error/failure.dart';
import 'package:to_do_app/core/usecase/base_usecase.dart';
import 'package:to_do_app/home/domain/repository/base_home_repository.dart';

class DeleteToDoUseCase extends BaseUseCase<int, DeleteToDoParameters> {
  final BaseHomeRepository baseHomeRepository;

  DeleteToDoUseCase(this.baseHomeRepository);

  @override
  Future<Either<Failure, int>> call(DeleteToDoParameters parameters) async {
    return await baseHomeRepository.deleteToDo(parameters);
  }
}

class DeleteToDoParameters extends Equatable {
  final int uid;

  const DeleteToDoParameters(this.uid);

  @override
  List<Object> get props => [uid];
}
