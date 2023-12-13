import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/feature/screens/recycle_bin.dart';
import 'package:task_app/feature/screens/tabs_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: context.sized.height * 0.05,
          ),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(TabScreen.id),
                child: ListTile(
                  leading: const Icon(Icons.folder_special),
                  title: const Text("My Tasks"),
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
                  leading: const Icon(Icons.delete),
                  title: const Text("Trash"),
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
