import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:task_app/blocs/bloc_exports.dart';

import 'package:task_app/feature/screens/tabs_screen.dart';
import 'package:task_app/product/init/initialize/app_start_init.dart';
import 'package:task_app/product/init/product_localization.dart';
import 'package:task_app/product/service/navigation/app_router.dart';
import 'package:task_app/product/theme/app_theme.dart';

Future<void> main() async {
  await ApplicationStart.init();
  runApp(ProductLocalization(
    child: MyApp(
      appRouter: AppRouter(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TasksBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Notedle',
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            theme: state.switchValue
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            home: const TabScreen(),
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
//
