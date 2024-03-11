import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/error/failure.dart';
import 'package:to_do_app/core/usecase/base_usecase.dart';
import 'package:to_do_app/home/domain/entities/to_do.dart';
import 'package:to_do_app/home/domain/repository/base_home_repository.dart';

class GetToDoListUseCase extends BaseUseCase<List<ToDo>, NoParameters> {
  final BaseHomeRepository baseHomeRepository;

  GetToDoListUseCase(this.baseHomeRepository);

  @override
  Future<Either<Failure, List<ToDo>>> call(NoParameters parameters) async {
    return await baseHomeRepository.getToDoList(parameters);
  }
}
