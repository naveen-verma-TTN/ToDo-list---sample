import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todo_flutter/models/task.dart';

/// Created by Naveen Verma on 17-12-2021
/// To The New
/// naveen.verma@tothenew.com
///

class TaskData extends ChangeNotifier {
  final List<Task> _taskList = [
    Task(name: "Buy milk", isDone: false),
  ];

  UnmodifiableListView<Task> get taskList {
    return UnmodifiableListView(_taskList);
  }

  int get taskCount {
    return _taskList.length;
  }

  void addTask(String text) {
    _taskList.add(Task(name: text, isDone: false));
    notifyListeners();
  }

  void toggleIsDone(bool isChecked, int i) {
    _taskList[i].isDone = isChecked;
    notifyListeners();
  }

  void deleteTask(Task task) {
    _taskList.remove(task);
    notifyListeners();
  }
}
