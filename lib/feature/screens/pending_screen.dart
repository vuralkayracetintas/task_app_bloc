import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/feature/screens/add_task_screen.dart';
import 'package:task_app/product/models/task_model.dart';
import 'package:task_app/product/widgets/drawer.dart';
import 'package:task_app/product/widgets/tasks_list_widget.dart';

class PendingScreen extends StatelessWidget {
  const PendingScreen({super.key});

  static const String id = 'pending_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.pendingTask;
        return Column(
          children: [
            Center(
              child: Chip(
                label: Text(
                    '${state.pendingTask.length} Tasks ${state.completedTask.length} Complated'),
              ),
            ),
            TaskListWidget(taskList: taskList),
            SizedBox(height: context.sized.height * 0.1),
          ],
        );
      },
    );
  }
}
