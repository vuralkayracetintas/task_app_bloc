import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/feature/screens/recycle/recycle_bin_body.dart';
import 'package:task_app/product/init/language/locale_keys.g.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});

  static const id = 'recycle_bin';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Chip(
                label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("${state.removedTasks.length} "),
                const Text(
                  LocaleKeys.trash_chip_title,
                ).tr(),
              ],
            )),
            actions: [
              TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(LocaleKeys.trash_delete_all).tr(),
                          content: const Text('Are you sure?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                context.read<TasksBloc>().add(DeleteAllTasks());
                                Navigator.pop(context);
                              },
                              child: const Text('Yes'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('No'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  // onPressed: () =>
                  //     context.read<TasksBloc>().add(DeleteAllTasks()),
                  child: const Text(LocaleKeys.trash_delete_all).tr())
            ],
          ),

          body: Column(
            children: [
              const Expanded(
                // child: SingleChildScrollView(
                //     // child: TaskListWidget(
                //     //   taskList: state.removedTasks,
                //     //   isCompleted: false,
                //     // ),

                //     )
                child: RecycleBinBody(
                  isCompleted: false,
                ),
              ),
              SizedBox(
                height: context.sized.height * 0.05,
              )
            ],
          ),
          // body: Expanded(
          //   child: SingleChildScrollView(

          //   ),
          // ),
        );
      },
    );
  }
}
