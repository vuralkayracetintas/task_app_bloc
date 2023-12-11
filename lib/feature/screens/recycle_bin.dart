import 'package:flutter/material.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/product/widgets/tasks_list_widget.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});

  static const id = 'recycle_bin';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              actions: [
                TextButton(
                    onPressed: () {
                      context.read<TasksBloc>().add(DeleteAllTasks());
                    },
                    child: const Text('Clear All'))
              ],
            ),
            body: Center(
                child: Column(
              children: [
                Chip(label: Text('${state.removedTasks.length} deleted task')),
                TaskListWidget(taskList: state.removedTasks)
              ],
            )));
      },
    );
  }
}
