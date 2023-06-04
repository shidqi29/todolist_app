import 'package:get/get.dart';
import 'package:todolist_app/models/task.dart';

import '../db/db_helper.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await DBHelper.insertTask(task);
  }

  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DBHelper.queryTask();
    taskList.assignAll(tasks.map((data) => new Task.fromJson(data)).toList());
  }

  void deleteTask(Task task) {
    DBHelper.deleteTask(task);
    getTasks();
  }

  void markTaskCompleted(int id) async {
    await DBHelper.updateTask(id);
    getTasks();
  }
}
