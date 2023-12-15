import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/feature/screens/recycle_bin.dart';
import 'package:task_app/feature/screens/tabs_screen.dart';
import 'package:task_app/product/constants/color_constants.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Color chipBackgroundContoller(int index) {
    //   if (index < 5) {
    //     return ColorConstants.lightGreen;
    //   } else if (index >= 5 && index < 10) {
    //     return ColorConstants.orange;
    //   } else {
    //     return Colors.red;
    //   }
    // }

    return Drawer(
      // backgroundColor: context.general.appTheme.drawerTheme.backgroundColor,
      backgroundColor: context.general.appTheme.backgroundColor,
      child: //Container(
          // decoration: const BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     colors: [
          //       // ColorConstants.orange,
          //       // ColorConstants.lightGreen,
          //       Colors.white,
          //       ColorConstants.darkGreen,
          //     ],
          //   ),
          // ),
          SafeArea(
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
                    title: const Text(
                      "My Tasks",
                    ),
                    trailing: Chip(
                      padding: context.padding.low,
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
                      padding: context.padding.low,
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
      ),
      //  ),
    );
  }
}
