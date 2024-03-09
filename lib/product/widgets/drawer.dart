import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/blocs/bloc_exports.dart';

import 'package:task_app/feature/screens/language/language_screen.dart';
import 'package:task_app/feature/screens/recycle/recycle_bin.dart';
import 'package:task_app/feature/screens/tabs_screen.dart';
import 'package:task_app/product/init/language/locale_keys.g.dart';
import 'package:task_app/product/widgets/localization/locale_text.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.general.appTheme.backgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: context.sized.height * 0.05,
            ),

            /// My Tasks Button
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(TabScreen.id),
                  child: ListTile(
                    leading: const Icon(Icons.folder_special),
                    title: const Text(LocaleKeys.drawer_mytask).tr(),
                    trailing: Chip(
                      padding: context.padding.low,
                      label: Text(state.pendingTask.length.toString()),
                    ),
                  ),
                );
              },
            ),

            /// Trash Button
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(RecycleBin.id),
                  child: ListTile(
                    leading: const Icon(Icons.delete),
                    title: const LocaleText(text: LocaleKeys.drawer_trash),
                    trailing: Chip(
                      padding: context.padding.low,
                      label: Text(state.removedTasks.length.toString()),
                    ),
                  ),
                );
              },
            ),

            /// Theme mode switch
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return ListTile(
                  leading: state.switchValue
                      ? const Icon(Icons.dark_mode)
                      : const Icon(Icons.light_mode),
                  title: const LocaleText(text: LocaleKeys.drawer_thememode),
                  trailing: Switch(
                    value: state.switchValue,
                    onChanged: (newValue) {
                      newValue
                          ? context.read<SwitchBloc>().add(SwitchOnEvent())
                          : context.read<SwitchBloc>().add(SwitchOffEvent());
                    },
                  ),
                );
              },
            ),

            /// Change language button
            GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(LanguageScreen.id),
              child: ListTile(
                leading: const Icon(Icons.flag),
                // title: LocaleText(text: LocaleKeys.drawer_changelanguage),

                title: const Text(LocaleKeys.drawer_changelanguage).tr(),
              ),
            ),
          ],
        ),
      ),
      //  ),
    );
  }
}
