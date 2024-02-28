import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/feature/screens/pending/pending_body_view.dart';
import 'package:task_app/product/init/language/locale_keys.g.dart';
import 'package:task_app/product/init/product_localization.dart';
import 'package:task_app/product/utility/constant/enums/locales.dart';
import 'package:task_app/product/widgets/localization/locale_text.dart';

class PendingScreen extends StatefulWidget {
  const PendingScreen({super.key});

  static const String id = 'pending_screen';

  @override
  State<PendingScreen> createState() => _PendingScreenState();
}

String xValue = LocaleKeys.home_todo_chip_first.tr();

class _PendingScreenState extends State<PendingScreen> {
  @override
  Widget build(BuildContext context) {
    // final AdsFunction adsFunction = AdsFunction();
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Chip(
                // backgroundColor: ColorConstants.hotPink,
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Text(LocaleKeys.home_todo_chip_first)
                    //     .tr(args: ["${state.pendingTask.length}"]),

                    Text(
                        '${state.pendingTask.length} ${LocaleKeys.home_todo_chip_first.tr()} ${state.completedTask.length} ${LocaleKeys.home_todo_chip_second.tr()}'),
                  ],
                ),
              ),
              const PendingTaskBody(
                isCompleted: false,
              ),
              // TaskListWidget(taskList: taskList),
              SizedBox(height: context.sized.height * 0.09),
              // adsFunction.getAd(),
            ],
          ),
        );
      },
    );
  }
}
