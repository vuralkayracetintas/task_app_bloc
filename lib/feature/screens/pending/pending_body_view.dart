import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/product/constants/color_constants.dart';
import 'package:task_app/product/models/task_model.dart';
import 'package:task_app/product/widgets/card_action_button.dart';
import 'package:task_app/product/widgets/card_top_widget.dart';

class PendingTaskBody extends StatelessWidget {
  const PendingTaskBody({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
      List<Task> taskList = state.pendingTask;

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
                            // height: context.sized.height * 0.3,
                            child: Card(
                              elevation: 5,

                              // shape: RoundedRectangleBorder(
                              //   borderRadius: BorderRadius.circular(20),
                              // ),
                              // shadowColor: Colors.black,
                              // surfaceTintColor: Colors.black,
                              // color: Colors.blueGrey[500],
                              color: context.general.appTheme.cardColor,
                              // color: Color(0xffF7FBFC),
                              // color: ColorConstants.purple3,
                              // color: context.general.appTheme
                              // .floatingActionButtonTheme.backgroundColor,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CardTop(
                                    task: e,
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: context.padding.onlyLeftLow +
                                          context.padding.onlyRightLow +
                                          context.padding.onlyTopLow,
                                      child: Text(
                                        e.title,
                                        textAlign: TextAlign.center,
                                        style: context
                                            .general.textTheme.headlineSmall
                                            ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: context.sized.height * 0.03,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CardActionButton(
                                          icon: const Icon(Icons.edit),
                                          onPressed: () {},
                                        ),
                                        CardActionButton(
                                          icon: const Icon(Icons.delete),
                                          onPressed: () {},
                                        ),
                                        CardActionButton(
                                          icon: const Icon(Icons.delete),
                                          onPressed: () {},
                                        )
                                      ],
                                    ),
                                  ),
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
