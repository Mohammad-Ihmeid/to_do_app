import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app/core/error/failure.dart';
import 'package:to_do_app/core/usecase/base_usecase.dart';
import 'package:to_do_app/home/domain/entities/to_do.dart';
import 'package:to_do_app/home/domain/repository/base_home_repository.dart';

class GetToDoUseCase extends BaseUseCase<ToDo, GetToDoParameters> {
  final BaseHomeRepository baseHomeRepository;

  GetToDoUseCase(this.baseHomeRepository);
  @override
  Future<Either<Failure, ToDo>> call(GetToDoParameters parameters) async {
    return await baseHomeRepository.getToDo(parameters);
  }
}

class GetToDoParameters extends Equatable {
  final int noteID;

  const GetToDoParameters(this.noteID);

  @override
  List<Object> get props => [noteID];
}
