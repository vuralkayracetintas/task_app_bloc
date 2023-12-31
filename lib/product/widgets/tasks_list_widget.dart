import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'package:task_app/product/models/task_model.dart';
import 'package:task_app/product/widgets/task_tile.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({super.key, required this.taskList, this.isCompleted});

  final List<Task> taskList;
  final bool? isCompleted;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList.radio(
        dividerColor: context.general.appTheme.dividerTheme.color,
        elevation: 2,
        // expandIconColor: Colors.red,
        children: taskList
            .map((task) => ExpansionPanelRadio(
                // backgroundColor: Theme.of(context).backgroundColor,
                value: task.id,
                headerBuilder: (context, isOpen) => TaskTile(
                      task: task,
                      isCompleted: isCompleted ?? false,
                    ),
                body: Padding(
                  padding: context.padding.low,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Title : ${task.title}'),
                      SizedBox(height: context.sized.height * 0.01),
                      Text('Description : ${task.description}'),
                      SizedBox(height: context.sized.height * 0.02),
                    ],
                  ),
                )))
            .toList());
  }
}




/*
Expanded(
      child: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          var task = taskList[index];

          return TaskTile(task: task);
        },
      ),
    )
*/