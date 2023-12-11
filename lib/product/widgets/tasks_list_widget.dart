import 'package:flutter/material.dart';

import 'package:task_app/product/models/task_model.dart';
import 'package:task_app/product/widgets/task_tile.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({super.key, required this.taskList});

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
            children: taskList
                .map((task) => ExpansionPanelRadio(
                    value: task.id,
                    headerBuilder: (context, isOpen) => TaskTile(task: task),
                    // body: Text('Description: ${task.description}'),
                    body: SelectableText.rich(TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Task : ',
                        ),
                        TextSpan(
                          text: task.title,
                        ),
                        const TextSpan(
                          text: '\n\nDescription:   ',
                        ),
                        TextSpan(
                          text: task.description,
                        )
                      ],
                    ))))
                .toList()),
      ),
    );
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