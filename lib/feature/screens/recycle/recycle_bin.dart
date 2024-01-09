import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/feature/screens/recycle/recycle_bin_body.dart';
import 'package:task_app/product/widgets/tasks_list_widget.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});

  static const id = 'recycle_bin';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title:
                Chip(label: Text('${state.removedTasks.length} deleted task')),
            actions: [
              TextButton(
                  onPressed: () =>
                      context.read<TasksBloc>().add(DeleteAllTasks()),
                  child: const Text('Clear All'))
            ],
          ),

          body: Column(
            children: [
              Expanded(
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
