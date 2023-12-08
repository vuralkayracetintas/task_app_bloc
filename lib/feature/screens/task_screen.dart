import 'package:flutter/material.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/feature/screens/add_task_screen.dart';
import 'package:task_app/product/models/task_model.dart';
import 'package:task_app/product/widgets/tasks_list_widget.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => const SingleChildScrollView(
              child: AddTaskScreen(),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Task App'),
          ),
          body: Column(
            children: [
              const Center(
                child: Chip(
                  label: Text('task'),
                ),
              ),
              TaskListWidget(taskList: taskList)
            ],
          ),
          floatingActionButton: FloatingActionButton(
            tooltip: 'Add Task',
            onPressed: () => _addTask(context),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
