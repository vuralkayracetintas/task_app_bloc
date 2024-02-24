import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/feature/screens/pending/pending_body_view.dart';
import 'package:task_app/product/init/language/locale_keys.g.dart';
import 'package:task_app/product/init/product_localization.dart';
import 'package:task_app/product/utility/constant/enums/locales.dart';

class PendingScreen extends StatefulWidget {
  const PendingScreen({super.key});

  static const String id = 'pending_screen';

  @override
  State<PendingScreen> createState() => _PendingScreenState();
}

class _PendingScreenState extends State<PendingScreen> {
  @override
  Widget build(BuildContext context) {
    // final AdsFunction adsFunction = AdsFunction();
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: context.sized.width * 0.2,
                  ),
                  Expanded(
                    child: Chip(
                      // backgroundColor: ColorConstants.hotPink,
                      label: Text(
                          '${state.pendingTask.length} Tasks ${state.completedTask.length} Completed'),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      ProductLocalization.updateLanguage(
                        context: context,
                        value: Locales.en,
                      );
                    },
                    child: const Text(LocaleKeys.general_button_save).tr(),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ProductLocalization.updateLanguage(
                        context: context,
                        value: Locales.tr,
                      );
                    },
                    child: const Text(LocaleKeys.general_button_save).tr(),
                  )
                  // TextButton(
                  //   onPressed: state.pendingTask.isNotEmpty
                  //       ? () {
                  //           showDialog(
                  //             context: context,
                  //             builder: (context) {
                  //               return AlertDialog(
                  //                 backgroundColor:
                  //                     context.general.appTheme.cardColor,
                  //                 title: const Text(
                  //                   'Delete All',
                  //                   style: TextStyle(color: Colors.black),
                  //                 ),
                  //                 content: const Text(
                  //                   'Are you sure?',
                  //                   style: TextStyle(color: Colors.black),
                  //                 ),
                  //                 actions: [
                  //                   TextButton(
                  //                     onPressed: () {
                  //                       context
                  //                           .read<TasksBloc>()
                  //                           .add(DeleteAllTaskHome());
                  //                       Navigator.pop(context);
                  //                     },
                  //                     child: const Text(
                  //                       'Yes',
                  //                       style: TextStyle(color: Colors.black),
                  //                     ),
                  //                   ),
                  //                   TextButton(
                  //                     onPressed: () {
                  //                       Navigator.pop(context);
                  //                     },
                  //                     child: const Text(
                  //                       'No',
                  //                       style: TextStyle(color: Colors.black),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               );
                  //             },
                  //           );
                  //         }
                  //       : null,
                  //   // onPressed: () =>
                  //   //     context.read<TasksBloc>().add(DeleteAllTaskHome()),
                  //   child: const Text('Remove all'),
                  // ),
                ],
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
