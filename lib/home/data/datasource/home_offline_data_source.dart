import 'package:to_do_app/core/error/exceptions.dart';
import 'package:to_do_app/core/translation/app_string.dart';
import 'package:to_do_app/core/usecase/base_usecase.dart';
import 'package:to_do_app/db/sqldb.dart';
import 'package:to_do_app/home/data/model/to_do_model.dart';
import 'package:to_do_app/home/domain/usecases/add_to_do_usecase.dart';
import 'package:to_do_app/home/domain/usecases/delete_to_do_usecase.dart';
import 'package:to_do_app/home/domain/usecases/get_to_do_usecase.dart';
import 'package:to_do_app/home/domain/usecases/update_to_do_usecase.dart';

abstract class BaseHomeOfflineDataSource {
  Future<int> addToDo(AddToDoParameters parameters);

  Future<int> updateToDo(UpdateToDoParameters parameters);

  Future<int> deleteToDo(DeleteToDoParameters parameters);

  Future<ToDoModel> getToDo(GetToDoParameters parameters);

  Future<List<ToDoModel>> getToDoList(NoParameters parameters);
}

class HomeOfflineDataSource extends BaseHomeOfflineDataSource {
  SqlDb sqlDb = SqlDb();

  @override
  Future<int> addToDo(AddToDoParameters parameters) async {
    final response = await sqlDb.insertData(
      '''INSERT INTO 'ToDoList' 
        (Title,SubTitle,DateCreatedNote,DateDeadlineNote,ImageNote) VALUES 
        ('${parameters.title}','${parameters.subTitle}','${parameters.dateCreatedNote}',
        '${parameters.dateDeadlineNote}','${parameters.imageNote}')''',
    );

    if (response != 0) {
      return response;
    } else {
      throw DataBaseException(message: AppString.addToDoError);
    }
  }

  @override
  Future<List<ToDoModel>> getToDoList(NoParameters parameters) async {
    final response = await sqlDb.readData("SELECT * FROM 'ToDoList'");

    return List<ToDoModel>.from(
      (response as List).map((e) => ToDoModel.fromJson(e)),
    );
  }

  @override
  Future<int> deleteToDo(DeleteToDoParameters parameters) async {
    final response = await sqlDb
        .deleteData("DELETE FROM 'ToDoList' WHERE ID = ${parameters.uid}");

    if (response != 0) {
      return response;
    } else {
      throw DataBaseException(message: AppString.deleteToDoError);
    }
  }

  @override
  Future<ToDoModel> getToDo(GetToDoParameters parameters) async {
    final response = await sqlDb
        .readData("SELECT * FROM 'ToDoList' WHERE ID = ${parameters.noteID}");

    return List<ToDoModel>.from(
      (response as List).map((e) => ToDoModel.fromJson(e)),
    ).first;
  }

  @override
  Future<int> updateToDo(UpdateToDoParameters parameters) async {
    final response = await sqlDb.updateData(
      '''UPDATE 'ToDoList' SET 
        Title = '${parameters.title}',
        SubTitle = '${parameters.subTitle}',
        DateDeadlineNote = '${parameters.dateDeadlineNote}',
        ImageNote = '${parameters.imageNote}' 
        WHERE ID = ${parameters.noteID}''',
    );

    if (response != 0) {
      return response;
    } else {
      throw DataBaseException(message: AppString.addToDoError);
    }
  }
}
