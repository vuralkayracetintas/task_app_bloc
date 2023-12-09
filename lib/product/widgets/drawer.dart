import 'package:flutter/material.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/feature/screens/recycle_bin.dart';
import 'package:task_app/feature/screens/tabs_screen.dart';
import 'package:task_app/feature/screens/pending_screen.dart';

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
                onTap: () => Navigator.of(context).pushNamed(TabScreen.id),
                child: ListTile(
                  leading: Icon(Icons.folder_special),
                  title: Text("My Tasks"),
                  trailing: Chip(
                    label: Text(state.pendingTask.length.toString()),
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
          ),
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              return Switch(
                value: state.switchValue,
                onChanged: (newValue) {
                  newValue
                      ? context.read<SwitchBloc>().add(SwitchOnEvent())
                      : context.read<SwitchBloc>().add(SwitchOffEvent());
                },
              );
            },
          )
        ],
      ),
    ));
  }
}
