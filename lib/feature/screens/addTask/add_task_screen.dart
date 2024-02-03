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
    // AdsFunction adsFunction = AdsFunction();

    return Container(
      color: context.general.appTheme.backgroundColor,
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
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                label: Text('Title'),
                // focusedBorder:
                //     OutlineInputBorder(borderSide: BorderSide(width: 2)),
                // enabledBorder: OutlineInputBorder(
                //     borderSide: BorderSide(color: Colors.red, width: 2)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2)),
              ),
            ),
            SizedBox(height: context.sized.height * 0.025),
            TextField(
              autofocus: true,
              controller: descriptionController,
              minLines: 3,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              decoration: const InputDecoration(
                label: Text('description'),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: context.sized.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (titleController.text.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Warning'),
                            content: const Text('Title cannot be empty.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      var task = titleController.text;
                      var desc = descriptionController.text;
                      context.read<TasksBloc>().add(
                            AddTask(
                              task: Task(
                                title: task,
                                id: GUIDGen.generate(),
                                description: desc,
                                date: DateTime.now().toString(),
                              ),
                            ),
                          );
                      Navigator.pop(context);
                      debugPrint(task);
                      debugPrint(desc);
                      debugPrint(GUIDGen.generate());
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
            SizedBox(height: context.sized.height * 0.3)
          ],
        ),
      ),
    );
  }
}
