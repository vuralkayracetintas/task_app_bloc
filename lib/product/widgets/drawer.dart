import 'package:flutter/material.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/feature/screens/recycle_bin.dart';
import 'package:task_app/feature/screens/task_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
      child: Column(
        children: [
          Text('Task Drawer'),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(TaskScreen.id),
                child: ListTile(
                  leading: Icon(Icons.folder_special),
                  title: Text("My Tasks"),
                  trailing: Chip(
                    label: Text(state.allTasks.length.toString()),
                  ),
                ),
              );
            },
          ),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(RecycleBin.id),
                child: ListTile(
                  leading: Icon(Icons.delete),
                  title: Text("Trash"),
                  trailing: Chip(
                    label: Text(state.removedTasks.length.toString()),
                  ),
                ),
              );
            },
          )
        ],
      ),
    ));
  }
}
