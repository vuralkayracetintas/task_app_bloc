import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/product/models/task_model.dart';
import 'package:task_app/product/service/guid.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    return Container(
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
                      context.read<TasksBloc>().add(AddTask(
                              task: Task(
                            title: task,
                            id: GUIDGen.generate(),
                            description: desc,
                          )));
                      Navigator.pop(context);
                      print(task);
                      print(desc);
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
