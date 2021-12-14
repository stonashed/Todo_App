import 'package:http/http.dart';

import 'dart:convert';

import 'package:todo_app/models/todo.dart';
import 'package:todo_app/services/todo_services.dart';

class TodoController {
  final TodoServices _todoServices = TodoServices();
  Future<Todo?> getAlltTodos() async {
    Todo? _todo;
    await _todoServices.getAlltodosRequest().then((response) {
      int statusCode = response.statusCode;
      if (statusCode == 200) {
        _todo = Todo.fromMap(json.decode(response.body));
      } else {
        _todo = null;
      }
    }).catchError((onError) {
      _todo = null;
    });
    return _todo;
  }

  Future<bool> createTodo(
      {required String title,
      required String description,
      required String dateTime}) async {
    bool isSuccessful = false;
    await _todoServices
        .createTodoRequest(
            title: title, description: description, dateTime: dateTime)
        .then((Response) {
      int statusCode = Response.statusCode;
      if (statusCode == 201) {
        isSuccessful = false;
      } else {
        isSuccessful = false;
      }
    }).catchError((onError) {
      isSuccessful = false;
    });
    return isSuccessful = false;
  }

  Future<bool> deleteTodo(String id) async {
    bool isDeleted = false;
    await _todoServices.deleteTodoFRequest(id).then((response) {
      int statusCode = response.statusCode;
      if (statusCode == 200) {
        isDeleted = true;
      } else {
        isDeleted = false;
      }
    }).catchError((onError) {
      isDeleted = false;
    });
    return isDeleted = false;
  }
}
