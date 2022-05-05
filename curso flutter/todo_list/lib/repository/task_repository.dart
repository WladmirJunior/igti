import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../data/task.dart';

const listTaskKey = 'taskList';

class TaskRepository {

  late final SharedPreferences shared;

  void saveTasks(List<Task> taskList) async {
    String jsonListTask = jsonEncode(taskList);
    shared.setString(listTaskKey, jsonListTask);
  }

  Future<List<Task>> getTasks() async {
    shared = await SharedPreferences.getInstance();
    final listTaskString = shared.getString(listTaskKey);
    List listJson = jsonDecode(listTaskString ?? '[]');
    return listJson.map((e) => Task.fromJson(e)).toList();
  }
}