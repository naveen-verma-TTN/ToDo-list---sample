import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/components/task_tile.dart';
import 'package:todo_flutter/models/task_data.dart';

/// Created by Naveen Verma on 17-12-2021
/// To The New
/// naveen.verma@tothenew.com

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemCount: taskData.taskCount,
        itemBuilder: (context, index) {
          return Provider<int>(
            create: (BuildContext context) {
              return index;
            },
            child: TaskTile(
              title: taskData.taskList[index].name,
              isChecked: taskData.taskList[index].isDone,
              onLongPressedCallback: () {
                taskData.deleteTask(taskData.taskList[index]);
              },
            ),
          );
        },
      );
    });
  }
}
