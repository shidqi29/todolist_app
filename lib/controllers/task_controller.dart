import 'package:get/get.dart';
import 'package:todolist_app/models/task.dart';

import '../db/db_helper.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task!);
  }
}
