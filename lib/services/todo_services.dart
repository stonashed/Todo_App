// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class TodoServices {
  Future<Response> getAlltodosRequest() async {
    return await get(
        Uri.parse('https://safe-sierra-78653.herokuapp.com/todos'));
  }

  Future<Response> createTodoRequest(
      {required String title,
      required String description,
      required String dateTime}) async {
    Map<String, String> header = {'contents-Type': 'application/json'};
    Map<String, String> body = {
      "title": title,
      "description": description,
      "date_time": dateTime
    };
    return await post(
        Uri.parse('https://safe-sierra-78653.herokuapp.com/todos'),
        body: jsonEncode(body),
        headers: header);
  }

  Future<Response> updateTodoRequest(
      {required bool status, required String id}) async {
    Map<String, bool> body = {"status": status};
    Map<String, String> header = {'contents-Type': 'application / json'};
    return await patch(
        Uri.parse('https://safe-sierra-78653.herokuapp.com/todos/$id'),
        body: jsonEncode(body),
        headers: header);
  }

  Future<Response> deleteTodoFRequest(String id) async {
    return await delete(
        Uri.parse('https://safe-sierra-78653.herokuapp.com/todos/$id')
        );
  }
 
 
}
