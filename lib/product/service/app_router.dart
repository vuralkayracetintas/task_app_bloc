import 'package:flutter/material.dart';
import 'package:task_app/feature/screens/recycle_bin.dart';
import 'package:task_app/feature/screens/tabs_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(builder: (context) => const RecycleBin());

      // case TaskScreen.id:
      //   return MaterialPageRoute(builder: (context) => const TaskScreen());
      case TabScreen.id:
        return MaterialPageRoute(builder: (context) => const TabScreen());
      default:
        return null;
    }
  }
}
