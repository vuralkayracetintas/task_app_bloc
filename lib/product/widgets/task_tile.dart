import 'package:flutter/material.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/product/models/task_model.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  void removeOrDelete(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TasksBloc>().add(DeleteTask(task: task))
        : context.read<TasksBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          widget.task.title,
          style: TextStyle(
              decoration: widget.task.isDone!
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
        trailing: widget.task.isDeleted == false
            ? Checkbox(
                value: widget.task.isDone,
                onChanged: (value) {
                  context.read<TasksBloc>().add(UpdateTask(task: widget.task));
                },
              )
            : null,
        onLongPress: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Delete Task'),
                content: const Text('Are you sure?'),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel')),
                  TextButton(
                      onPressed: () {
                        // context.read<TasksBloc>().add(DeleteTask(task: task));
                        removeOrDelete(context, widget.task);
                        Navigator.pop(context);
                      },
                      child: const Text('Delete'))
                ],
              ),
            ));
  }
}
