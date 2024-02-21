import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/feature/screens/pending/pending_body_view.dart';

class PendingScreen extends StatelessWidget {
  const PendingScreen({super.key});

  static const String id = 'pending_screen';

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
                  TextButton(
                    onPressed: state.pendingTask.isNotEmpty
                        ? () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor:
                                      context.general.appTheme.cardColor,
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
                                        context
                                            .read<TasksBloc>()
                                            .add(DeleteAllTaskHome());
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
                    // onPressed: () =>
                    //     context.read<TasksBloc>().add(DeleteAllTaskHome()),
                    child: const Text('Remove all'),
                  ),
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
