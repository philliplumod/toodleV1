// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:toddle/db/db_helper.dart';
import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    getRecentCompletedTasks();
  }

  var taskList = <Task>[].obs;
  var recentCompletedTasks = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }

  void getTask() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks
        .map((data) => Task.fromJson(data))
        .where((task) => task.isCompleted != 1)
        .toList());
    debugPrint("Task list: $tasks");
  }

  void delete(Task task) async {
    if (task.isCompleted == 1) {
      // Task is completed, so don't delete it, just remove from taskList
      taskList.remove(task);
    } else {
      // Task is not completed, delete it and remove from both lists
      var val = await DBHelper.delete(task);
      taskList.remove(task);
      recentCompletedTasks
          .removeWhere((completedTask) => completedTask.id == task.id);
      debugPrint("Task deleted: $val");
    }
  }

  void taskCompleted(int id) async {
    var val = await DBHelper.update(id);
    getTask();
    debugPrint("task completed $val");
  }

  void getRecentCompletedTasks() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    recentCompletedTasks.assignAll(
      tasks
          .map((data) => Task.fromJson(data))
          .where((task) => task.isCompleted == 1)
          .toList(),
    );
    recentCompletedTasks.sort((a, b) => b.id!.compareTo(a.id!));
  }
}
