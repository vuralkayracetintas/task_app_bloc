import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/feature/screens/editTask/edit_task_screen.dart';
import 'package:task_app/product/models/task_model.dart';
import 'package:task_app/product/widgets/date_text_widget.dart';
import 'package:task_app/product/widgets/favorite_button.dart';
import 'package:task_app/product/widgets/popup_menu.dart';

class CardTop extends StatelessWidget {
  const CardTop({super.key, required this.task, required this.isCompleted});
  final Task task;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    void removeOrDelete(BuildContext context, Task task) {
      task.isDeleted!
          ? context.read<TasksBloc>().add(DeleteTask(task: task))
          : context.read<TasksBloc>().add(RemoveTask(task: task));
    }

    void editTask(
      BuildContext context,
    ) {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => SingleChildScrollView(
                child: EditTaskScreen(
                  oldTask: task,
                ),
              ));
    }

    return Padding(
      // padding: context.padding.low,
      padding: context.padding.onlyTopLow +
          context.padding.onlyLeftLow +
          context.padding.onlyRightLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FavoriteButton(
            task: task,
          ),
          DateTextWidget(task: task),
          PopupMenu(
            task: task,
            isCompleted: isCompleted,
            cancelOrDeleteCallBack: () => removeOrDelete(context, task),
            likeOrDislike: () => context
                .read<TasksBloc>()
                .add(FavoriteOrUnFavoriteTask(task: task)),
            editTask: () {
              // Navigator.pop(context);
              editTask(context);
            },
            restoreTask: () =>
                context.read<TasksBloc>().add(RestoreTasks(task: task)),
            completeTask: () =>
                context.read<TasksBloc>().add(UpdateTask(task: task)),
          )
        ],
      ),
    );
  }
}
