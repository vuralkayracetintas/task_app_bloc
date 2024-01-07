import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'package:task_app/product/models/task_model.dart';
import 'package:task_app/product/widgets/favorite_button.dart';

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FavoriteButton(
            task: task,
          ),
          // const Chip(
          //   avatar: Icon(Icons.priority_high),
          //   label: Text('High'),
          // ),
          // const IconButton(
          //     onPressed: null,
          //     // onPressed: () {
          //     //   context
          //     //       .read<TasksBloc>()
          //     //       .add(DeleteTask(task: e));
          //     // },
          //     icon: Icon(Icons.delete)),

          // TextButton(onPressed: () {}, child: Text('Details')),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => SingleChildScrollView(
                        child: Container(
                          height: 200,
                          color: Colors.white,
                          child: const Center(
                            child: Text('Details'),
                          ),
                        ),
                      ));
            },
            child: const Text('Details',
                style: TextStyle(
                  color: Colors.red,
                )),
          ),
        ],
      ),
    );
  }
}
