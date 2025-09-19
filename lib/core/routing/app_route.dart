import 'package:go_router/go_router.dart';

import '../../features/home/ui/screen/home_screen.dart';
import '../../features/splash/splash_screen.dart';
import 'app_route_path.dart';

GoRouter appRoute = GoRouter(
  initialLocation: AppRoutePath.splashRoute,
  routes: [
    GoRoute(
      path: AppRoutePath.splashRoute,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutePath.homeRoute,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
