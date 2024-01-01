import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/product/models/task_model.dart';

class DemoPanding extends StatelessWidget {
  const DemoPanding({
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
                  const Text('Pending Task'),
                  Text(
                    '${state.pendingTask.length} Tasks',
                  ),
                  ...taskList
                      .map(
                        (e) => SizedBox(
                          width: context.sized.width,
                          // height: context.sized.height * 0.3,
                          child: Card(
                            color: context.general.appTheme
                                .floatingActionButtonTheme.backgroundColor,
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
                                        color: Colors.white,
                                        fontSize: context.sized.height * 0.03,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CardActionButton(
                                        icon: Icon(Icons.edit),
                                        onPressed: () {},
                                      ),
                                      CardActionButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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

class CardActionButton extends StatelessWidget {
  CardActionButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });
  Icon icon;
  Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.sized.height * 0.08,
      width: context.sized.height * 0.08,
      child: Card(
        child: IconButton(
          onPressed: onPressed,
          icon: icon,
        ),
      ),
    );
  }
}

class CardTop extends StatelessWidget {
  CardTop({
    super.key,
    required this.task,
  });
  Task task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FavoriteButton(
            task: task,
          ),
          const Chip(
            avatar: Icon(Icons.priority_high),
            label: Text('High'),
          ),
          const IconButton(
              onPressed: null,
              // onPressed: () {
              //   context
              //       .read<TasksBloc>()
              //       .add(DeleteTask(task: e));
              // },
              icon: Icon(Icons.delete)),
        ],
      ),
    );
  }
}

class FavoriteButton extends StatelessWidget {
  FavoriteButton({super.key, required this.task});
  Task task;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: context.sized.height * 0.025,
        ),
        task.isFavorite == true
            ? IconButton(
                iconSize: context.sized.height * 0.02,
                color: Colors.white,
                onPressed: () {
                  context
                      .read<TasksBloc>()
                      .add(FavoriteOrUnFavoriteTask(task: task));
                },
                icon: const Icon(Icons.favorite))
            : IconButton(
                iconSize: context.sized.height * 0.02,
                onPressed: () {
                  context
                      .read<TasksBloc>()
                      .add(FavoriteOrUnFavoriteTask(task: task));
                },
                icon: const Icon(Icons.favorite_border))
      ],
    );
  }
}
