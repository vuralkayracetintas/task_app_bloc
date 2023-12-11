import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/product/models/task_model.dart';
import 'package:task_app/product/service/guid.dart';

class EditTaskScreen extends StatelessWidget {
  const EditTaskScreen({
    super.key,
    required this.oldTask,
  });
  final Task oldTask;
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: oldTask.title);
    TextEditingController descriptionController = TextEditingController(
      text: oldTask.description,
    );
    return Container(
      padding: context.padding.onlyBottomHigh,
      child: Container(
        padding: context.padding.low,
        child: Column(
          children: [
            Text(
              'Edit Task',
              style: context.general.textTheme.titleLarge,
            ),
            SizedBox(height: context.sized.height * 0.013),
            TextField(
              autofocus: true,
              controller: titleController,
              decoration: const InputDecoration(
                  label: Text('Title'), border: OutlineInputBorder()),
            ),
            SizedBox(height: context.sized.height * 0.025),
            TextField(
              autofocus: true,
              controller: descriptionController,
              minLines: 3,
              maxLines: 5,
              decoration: const InputDecoration(
                  label: Text('description'), border: OutlineInputBorder()),
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
                      var desc = descriptionController.text;
                      var editedTask = Task(
                        title: task,
                        description: desc,
                        id: oldTask.id,
                        isDone: false,
                        isFavorite: oldTask.isFavorite,
                        date: DateTime.now().toString(),
                      );
                      context.read<TasksBloc>().add(
                          EditTasks(oldTask: oldTask, newTask: editedTask));
                      Navigator.pop(context);

                      print(GUIDGen.generate());
                    },
                    child: const Text('Save'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
