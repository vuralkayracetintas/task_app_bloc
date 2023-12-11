import 'package:flutter/material.dart';
import 'package:task_app/blocs/bloc_exports.dart';

import 'package:task_app/product/models/task_model.dart';

import 'package:task_app/product/widgets/tasks_list_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  static const String id = 'favorite_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.favoriteTask;
        return Column(
          children: [
            const Text('favorite'),
            Center(
              child: Chip(
                label: Text('${state.favoriteTask.length} Tasks'),
              ),
            ),
            TaskListWidget(taskList: taskList)
          ],
        );
      },
    );
  }
}
