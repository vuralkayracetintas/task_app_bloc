import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/product/models/task_model.dart';

class DateTextWidget extends StatelessWidget {
  const DateTextWidget({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat().add_yMMMd().add_Hm().format(DateTime.parse(task.date)),
      style: context.general.textTheme.bodySmall?.copyWith(
        color: Colors.black,
      ),
    );
  }
}
