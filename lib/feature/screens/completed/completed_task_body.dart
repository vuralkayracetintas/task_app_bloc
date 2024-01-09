import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/product/models/task_model.dart';
import 'package:task_app/product/widgets/card_top_widget.dart';

class CompletedTaskBody extends StatelessWidget {
  const CompletedTaskBody({
    Key? key,
    required this.isCompleted,
  });

  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
      List<Task> taskList = state.completedTask;

      return SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  ...taskList
                      .map(
                        (e) => Padding(
                          padding: context.padding.low,
                          child: SizedBox(
                            width: context.sized.width,
                            child: Card(
                              elevation: 5,
                              color: context.general.appTheme.cardColor,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CardTop(
                                    task: e,
                                    isCompleted: isCompleted,
                                  ),

                                  Center(
                                    child: Column(
                                      children: [
                                        // Taks title
                                        // if (e.isDeleted == false)
                                        //   Checkbox(
                                        //     value: e.isDone,
                                        //     onChanged: (value) {
                                        //       context
                                        //           .read<TasksBloc>()
                                        //           .add(UpdateTask(task: e));
                                        //     },
                                        //   ),
                                        Text(
                                          e.title,
                                          textAlign: TextAlign.center,
                                          style: context
                                              .general.textTheme.headlineSmall
                                              ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize:
                                                context.sized.height * 0.03,
                                          ),
                                        ),

                                        // Task Description
                                        Padding(
                                          padding: context.padding.low,
                                          child: SelectableText(
                                            e.description,
                                            textAlign: TextAlign.start,
                                            style: context
                                                .general.textTheme.bodyLarge
                                                ?.copyWith(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),

                                  // Padding(
                                  //   padding: const EdgeInsets.all(8.0),
                                  //   child: Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.spaceEvenly,
                                  //     crossAxisAlignment:
                                  //         CrossAxisAlignment.center,
                                  //     children: [
                                  //       CardActionButton(
                                  //         icon: const Icon(Icons.edit),
                                  //         onPressed: () {},
                                  //       ),
                                  //       CardActionButton(
                                  //         icon: const Icon(Icons.delete),
                                  //         onPressed: () {},
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
