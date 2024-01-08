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
        // List<Task> taskList = state.pendingTask;
        return SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Chip(
                  // backgroundColor: ColorConstants.hotPink,
                  label: Text(
                      '${state.pendingTask.length} Tasks ${state.completedTask.length} Completed'),
                ),
              ),
              PendingTaskBody(),
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
