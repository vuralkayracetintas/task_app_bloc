import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/feature/screens/favorite/favorite_task_body.dart';
import 'package:task_app/product/init/language/locale_keys.g.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({
    super.key,
  });

  static const String id = 'favorite_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        // List<Task> taskList = state.favoriteTask;

        return SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Chip(
                  label: state.favoriteTask.isNotEmpty
                      ? Text(
                          '${state.favoriteTask.length} ${LocaleKeys.home_favorite_chip_favorite.tr()}')
                      : const Text(LocaleKeys.home_favorite_chip_not).tr(),
                ),
              ),
              // TaskListWidget(
              //   taskList: taskList,
              //   isComplated: true,
              // ),
              const FavoriteTaskBody(
                isCompleted: true,
              )
            ],
          ),
        );
      },
    );
  }
}
