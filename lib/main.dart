import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/routing/app_route.dart';
import 'features/home/ui/provider/home_provider.dart';
import 'utils/print_log.dart';

void main() {
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      runApp(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => HomeProvider())],
          child: const MyApp(),
        ),
      );
    },
    (e, s) {
      printLog(
        'runZonedGuarded error: ${e.toString()} \nStack: ${s.toString()}',
        type: LogType.error,
      );
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
