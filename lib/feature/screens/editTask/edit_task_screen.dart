import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/product/init/language/locale_keys.g.dart';
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
      color: context.general.appTheme.backgroundColor,
      child: Container(
        padding: context.padding.low,
        child: Column(
          children: [
            Text(
              LocaleKeys.ad_edit_task_edit,
              style: context.general.textTheme.titleLarge,
            ).tr(),
            SizedBox(height: context.sized.height * 0.013),
            TextField(
              autofocus: true,
              controller: titleController,
              decoration: InputDecoration(
                  label: Text(LocaleKeys.ad_edit_task_title).tr(),
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: context.sized.height * 0.025),
            TextField(
              autofocus: true,
              controller: descriptionController,
              minLines: 5,
              maxLines: 10,
              decoration: InputDecoration(
                  label: Text(LocaleKeys.ad_edit_task_description).tr(),
                  border: OutlineInputBorder()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(LocaleKeys.general_button_cancel).tr(),
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
                    context
                        .read<TasksBloc>()
                        .add(EditTasks(oldTask: oldTask, newTask: editedTask));
                    // Navigator.pop(context);
                    context.route.navigation.pop();
                    debugPrint(GUIDGen.generate());
                  },
                  child: const Text(LocaleKeys.general_button_save).tr(),
                )
              ],
            ),
            SizedBox(height: context.sized.height * 0.1)
          ],
        ),
      ),
    );
  }
}
