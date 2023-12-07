import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/product/models/task_model.dart';
import 'package:task_app/product/widgets/tasks_list_widget.dart';

class TaskScreen extends StatelessWidget {
  TaskScreen({super.key});
  TextEditingController titleController = TextEditingController();

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: context.padding.onlyBottomHigh,
                child: Container(
                  padding: context.padding.low,
                  child: Column(
                    children: [
                      Text(
                        'Add Task',
                        style: context.general.textTheme.titleLarge,
                      ),
                      SizedBox(height: context.sized.height * 0.013),
                      TextField(
                        autofocus: true,
                        controller: titleController,
                        decoration: const InputDecoration(
                            label: Text('Title'), border: OutlineInputBorder()),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                var task = titleController.text;
                                context
                                    .read<TasksBloc>()
                                    .add(AddTask(task: Task(title: task)));
                              },
                              child: const Text('Save'))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
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
            child: const Icon(Icons.add),
            tooltip: 'Add Task',
            onPressed: () => _addTask(context),
          ),
        );
      },
    );
  }
}
