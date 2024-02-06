import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:path_provider/path_provider.dart';

import 'package:task_app/blocs/bloc_exports.dart';

import 'package:task_app/feature/screens/tabs_screen.dart';
import 'package:task_app/product/service/app_router.dart';
import 'package:task_app/product/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  // Future.delayed(const Duration(seconds: 2));
  // FlutterNativeSplash.remove();
  runApp(MyApp(
    appRouter: AppRouter(),
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
            // theme: ThemeData(
            //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            //   useMaterial3: true,
            // ),
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
