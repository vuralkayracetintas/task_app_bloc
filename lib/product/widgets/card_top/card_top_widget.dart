import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/feature/screens/editTask/edit_task_screen.dart';
import 'package:task_app/product/models/task_model.dart';
import 'package:task_app/product/widgets/date_text_widget.dart';
import 'package:task_app/product/widgets/favorite/favorite_button.dart';
import 'package:task_app/product/widgets/popup_menu.dart';

part 'card_top_widget_mixin.dart';

class CardTop extends StatefulWidget {
  const CardTop({super.key, required this.task, required this.isCompleted});
  final Task task;
  final bool isCompleted;

  @override
  State<CardTop> createState() => _CardTopState();
}

class _CardTopState extends State<CardTop> with CardTopWidgetMixin {

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: context.padding.low,
      padding: context.padding.onlyTopLow +
          context.padding.onlyLeftLow +
          context.padding.onlyRightLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (widget.task.isDeleted == false)
              ? FavoriteButton(
                  task: widget.task,
                )
              : SizedBox(
                  width: context.sized.width * 0.1,
                ),
          DateTextWidget(task: widget.task),
          PopupMenu(
            task: widget.task,
            isCompleted: widget.isCompleted,
            cancelOrDeleteCallBack: () => removeOrDelete(context, widget.task),
            likeOrDislike: () => likeOrDislike(),
            editTask: () => editTask(context),
            restoreTask: () => restoreTask(),
            completeTask: () => completeTask(),
          )
        ],
      ),
    );
  }
}
