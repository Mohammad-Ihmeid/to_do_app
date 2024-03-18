import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/error/failure.dart';
import 'package:to_do_app/core/usecase/base_usecase.dart';
import 'package:to_do_app/home/domain/entities/to_do.dart';
import 'package:to_do_app/home/domain/usecases/add_to_do_usecase.dart';
import 'package:to_do_app/home/domain/usecases/delete_to_do_usecase.dart';

abstract class BaseHomeRepository {
  Future<Either<Failure, int>> addToDo(AddToDoParameters parameters);

  Future<Either<Failure, List<ToDo>>> getToDoList(NoParameters parameters);

  Future<Either<Failure, int>> deleteToDo(DeleteToDoParameters parameters);
}
