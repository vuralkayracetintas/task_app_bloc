import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/feature/screens/completed/completed_task_body.dart';
import 'package:task_app/product/init/language/locale_keys.g.dart';
import 'package:task_app/product/models/task_model.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({super.key});

  static const String id = 'completed_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.completedTask;
        return SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Chip(
                  label: taskList.isNotEmpty
                      ? Text(
                          '${taskList.length} ${LocaleKeys.home_completed_chip_complete.tr()}')
                      : const Text(LocaleKeys.home_completed_chip_not).tr(),
                ),
              ),
              // TaskListWidget(taskList: taskList)
              const CompletedTaskBody(
                isCompleted: true,
              )
            ],
          ),
        );
      },
    );
  }
}
