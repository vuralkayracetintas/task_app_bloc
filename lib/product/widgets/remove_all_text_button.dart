import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/blocs/task_bloc/tasks_bloc.dart';
import 'package:task_app/product/init/language/locale_keys.g.dart';
import 'package:task_app/product/widgets/localization/locale_text.dart';

class RemoveAllTextButtonWidget extends StatelessWidget {
  const RemoveAllTextButtonWidget({super.key, required this.state});
  final TasksState state;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: state.pendingTask.isNotEmpty
          ? () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: context.general.appTheme.cardColor,
                    title: const Text(
                      'Delete All',
                      style: TextStyle(color: Colors.black),
                    ),
                    content: const Text(
                      'Are you sure?',
                      style: TextStyle(color: Colors.black),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          context.read<TasksBloc>().add(DeleteAllTaskHome());
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Yes',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'No',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          : null,
      // child: Padding(5
      //   padding: context.padding.onlyRightLow,
      //   child: const Text(LocaleKeys.home_todo_delete_all).tr(),
      // ),
      child: Padding(
          padding: context.padding.onlyRightLow,
          child: const LocaleText(text: LocaleKeys.home_todo_delete_all)),
    );
  }
}
