import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/feature/screens/edit_task_screen.dart';
import 'package:task_app/product/models/task_model.dart';
import 'package:task_app/product/widgets/popup_menu.dart';

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

  void _editTask(
    BuildContext context,
  ) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
              child: EditTaskScreen(
                oldTask: widget.task,
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.onlyLeftLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                // widget.task.isFavorite == false
                //     ? const Icon(Icons.star_border_outlined)
                //     : const Icon(Icons.star),
                SizedBox(
                  width: context.sized.width * 0.05,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.task.title,
                        style: TextStyle(
                            decoration: widget.task.isDone!
                                ? TextDecoration.lineThrough
                                : TextDecoration.none),
                      ),
                      Text(DateFormat()
                          .add_yMMMd()
                          .add_Hm()
                          .format(DateTime.parse(widget.task.date))),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                        // checkColor: Colors.black,
                        activeColor: context.general.appTheme
                            .floatingActionButtonTheme.backgroundColor,
                        value: widget.task.isDone,
                        onChanged: widget.task.isDeleted == false
                            ? (value) {
                                context
                                    .read<TasksBloc>()
                                    .add(UpdateTask(task: widget.task));
                              }
                            : null),
                    PopupMenu(
                      task: widget.task,
                      cancelOrDeleteCallBack: () =>
                          removeOrDelete(context, widget.task),
                      likeOrDislike: () => context
                          .read<TasksBloc>()
                          .add(FavoriteOrUnFavoriteTask(task: widget.task)),
                      editTask: () {
                        Navigator.pop(context);
                        _editTask(context);
                      },
                      restoreTask: () => context
                          .read<TasksBloc>()
                          .add(RestoreTasks(task: widget.task)),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
    // return ListTile(
    //     title: Text(
    //       widget.task.title,
    //       style: TextStyle(
    //           decoration: widget.task.isDone!
    //               ? TextDecoration.lineThrough
    //               : TextDecoration.none),
    //     ),
    //     trailing: widget.task.isDeleted == false
    //         ? Checkbox(
    //             value: widget.task.isDone,
    //             onChanged: (value) {
    //               context.read<TasksBloc>().add(UpdateTask(task: widget.task));
    //             },
    //           )
    //         : null,
    //     onLongPress: () => showDialog(
    //           context: context,
    //           builder: (context) => AlertDialog(
    //             title: const Text('Delete Task'),
    //             content: const Text('Are you sure?'),
    //             actions: [
    //               TextButton(
    //                   onPressed: () => Navigator.pop(context),
    //                   child: const Text('Cancel')),
    //               TextButton(
    //                   onPressed: () {
    //                     // context.read<TasksBloc>().add(DeleteTask(task: task));
    //                     removeOrDelete(context, widget.task);
    //                     Navigator.pop(context);
    //                   },
    //                   child: const Text('Delete'))
    //             ],
    //           ),
    //         ));
  }
}
