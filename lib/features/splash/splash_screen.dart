import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/extensions/context_extension.dart';
import '../../core/routing/app_route_path.dart';
import '../../utils/utils_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _redirectScreen());
  }

  void _redirectScreen() {
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      context.go(AppRoutePath.homeRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const FlutterLogo(size: 120),
              const Spacer(),
              Text('Powered by Flutter', style: context.bodySmallTextStyle),
              FutureBuilder(
                future: getAppVersion(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return Text(
                      snapshot.data.toString(),
                      style: context.bodyMediumTextStyle,
                    );
                  } else {
                    return const Text('Loading...');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
