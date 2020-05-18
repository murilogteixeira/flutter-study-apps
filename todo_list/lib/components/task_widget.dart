import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_list/model/task.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({Key key, this.task, this.onClickRemoveTask, this.onClickTask})
      : super(key: key);

  final Task task;
  final Function onClickRemoveTask;
  final Function onClickTask;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListTile(
          title: Text(task.title),
          subtitle: task.description.isEmpty || task.description == null
              ? null
              : Text("${task.description}\n${task.deadlineString}"),
          leading: Checkbox(
            value: task.check,
            onChanged: task.setCheck,
          ),
          trailing: IconButton(
            icon: Icon(Icons.remove_circle),
            color: Colors.red,
            onPressed: onClickRemoveTask,
          ),
          onTap: onClickTask,
        );
      },
    );
  }
}
