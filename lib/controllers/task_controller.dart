// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:toddle/db/db_helper.dart';
import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }

  void getTask() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
  }

  void delete(Task task) async {
    var val = await DBHelper.delete(task);
     debugPrint(val);
  }
}
