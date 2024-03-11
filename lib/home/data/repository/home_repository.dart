import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/error/exceptions.dart';
import 'package:to_do_app/core/error/failure.dart';
import 'package:to_do_app/core/translation/app_string.dart';
import 'package:to_do_app/core/usecase/base_usecase.dart';
import 'package:to_do_app/home/data/datasource/home_offline_data_source.dart';
import 'package:to_do_app/home/domain/entities/to_do.dart';
import 'package:to_do_app/home/domain/repository/base_home_repository.dart';
import 'package:to_do_app/home/domain/usecases/add_to_do_usecase.dart';

class HomeRepository extends BaseHomeRepository {
  final BaseHomeOfflineDataSource baseHomeOfflineDataSource;

  HomeRepository(this.baseHomeOfflineDataSource);
  @override
  Future<Either<Failure, int>> addToDo(AddToDoParameters parameters) async {
    try {
      final result = await baseHomeOfflineDataSource.addToDo(parameters);
      return Right(result);
    } on DataBaseException catch (failure) {
      return Left(LocalDataFailure(failure.message));
    } catch (e) {
      debugPrint(e.toString());
      return const Left(RemoteFailure(AppString.error));
    }
  }

  @override
  Future<Either<Failure, List<ToDo>>> getToDoList(
      NoParameters parameters) async {
    try {
      final result = await baseHomeOfflineDataSource.getToDoList(parameters);
      return Right(result);
    } on DataBaseException catch (failure) {
      return Left(LocalDataFailure(failure.message));
    } catch (e) {
      return const Left(RemoteFailure(AppString.error));
    }
  }
}
