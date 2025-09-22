import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/routing/app_route.dart';
import 'core/services/app_theme_service.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/ui/provider/auth_provider.dart';
import 'features/home/ui/provider/home_provider.dart';
import 'utils/print_log.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // load ENV file
      await dotenv.load();

      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AppThemeProvider()),
            ChangeNotifierProvider(create: (_) => HomeProvider()),
            ChangeNotifierProvider(create: (_) => AuthProvider()),
          ],
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
    return Consumer<AppThemeProvider>(
      builder: (context, appThemeP, _) {
        return MaterialApp.router(
          routerConfig: appRoute,
          debugShowCheckedModeBanner: false,
          theme: appThemeData(appThemeP),
        );
      },
    );
  }
}
