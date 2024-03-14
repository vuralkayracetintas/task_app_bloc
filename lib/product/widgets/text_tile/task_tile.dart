import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/product/models/task_model.dart';

part 'task_tile_mixin.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({
    super.key,
    required this.task,
    required this.isCompleted,
  });

  final Task task;
  final bool isCompleted;
  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> with TaskTileMixin {
  void removeOrDelete(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TasksBloc>().add(DeleteTask(task: task))
        : context.read<TasksBloc>().add(RemoveTask(task: task));
  }

  void isFavorite(BuildContext context, Task task) {
    context.read<TasksBloc>().add(FavoriteOrUnFavoriteTask(task: widget.task));
  }

  // void _editTask(
  //   BuildContext context,
  // ) {
  //   showModalBottomSheet(
  //       context: context,
  //       isScrollControlled: true,
  //       builder: (context) => SingleChildScrollView(
  //             child: EditTaskScreen(
  //               oldTask: widget.task,
  //             ),
  //           ));
  // }

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
                if (widget.task.isDeleted == false)
                  Row(
                    children: [
                      widget.isCompleted == false
                          ? Checkbox(
                              activeColor: context.general.appTheme
                                  .floatingActionButtonTheme.backgroundColor,
                              value: widget.task.isDone,
                              onChanged: widget.task.isDeleted == false
                                  ? (value) {
                                      updateTask(context);
                                    }
                                  : null,
                            )
                          : SizedBox(
                              width: context.sized.width * 0.05,
                            ),
                    ],
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FavoriteController extends StatelessWidget {
  const FavoriteController({
    super.key,
    required this.widget,
    required this.icon,
  });

  final TaskTile widget;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context
              .read<TasksBloc>()
              .add(FavoriteOrUnFavoriteTask(task: widget.task));
        },
        icon: icon);
  }
}
