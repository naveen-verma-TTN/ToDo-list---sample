import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_data.dart';

/// Created by Naveen Verma on 17-12-2021
/// To The New
/// naveen.verma@tothenew.com
///
class TaskTile extends StatelessWidget {
  final String title;
  final bool isChecked;
  final Function onLongPressedCallback;

  const TaskTile(
      {Key? key,
      required this.title,
      required this.isChecked,
      required this.onLongPressedCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () => onLongPressedCallback(),
      title: Text(
        title,
        style: TextStyle(
            decoration:
                isChecked ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      trailing: TaskCheckedBox(checkboxState: isChecked),
    );
  }
}

class TaskCheckedBox extends StatelessWidget {
  final bool checkboxState;

  const TaskCheckedBox({required this.checkboxState, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkboxState,
      onChanged: (newValue) {
        Provider.of<TaskData>(context, listen: false)
            .toggleIsDone(newValue!, Provider.of<int>(context, listen: false));
      },
    );
  }
}
