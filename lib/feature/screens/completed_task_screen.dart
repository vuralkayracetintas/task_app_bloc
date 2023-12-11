import 'package:flutter/material.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/product/models/task_model.dart';
import 'package:task_app/product/widgets/tasks_list_widget.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({super.key});

  static const String id = 'completed_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.completedTask;
        return Column(
          children: [
            const Text('completed'),
            Center(
              child: Chip(
                label: Text('${taskList.length} Tasks'),
              ),
            ),
            TaskListWidget(taskList: taskList)
          ],
        );
      },
    );
  }
}
