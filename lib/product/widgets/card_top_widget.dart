import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'package:task_app/product/models/task_model.dart';
import 'package:task_app/product/widgets/favorite_button.dart';

class CardTop extends StatelessWidget {
  CardTop({
    super.key,
    required this.task,
  });
  Task task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FavoriteButton(
            task: task,
          ),
          const Chip(
            avatar: Icon(Icons.priority_high),
            label: Text('High'),
          ),
          const IconButton(
              onPressed: null,
              // onPressed: () {
              //   context
              //       .read<TasksBloc>()
              //       .add(DeleteTask(task: e));
              // },
              icon: Icon(Icons.delete)),
        ],
      ),
    );
  }
}
