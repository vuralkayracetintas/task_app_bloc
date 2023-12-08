import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:task_app/blocs/bloc_exports.dart';

import 'package:task_app/feature/screens/task_screen.dart';
import 'package:task_app/product/models/task_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TasksBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: TaskScreen(),
      ),
    );
  }
}
