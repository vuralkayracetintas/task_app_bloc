import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/product/models/task_model.dart';

class TaskListWidget extends StatelessWidget {
  TaskListWidget({super.key, required this.taskList});

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          var task = taskList[index];

          return ListTile(
            title: Text(task.title),
            // trailing: Checkbox(
            //   value: task.isDone,
            //   onChanged: (valiue) {},
            // ),
          );
        },
      ),
    );
  }
}
