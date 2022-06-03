import 'package:flutter/material.dart';
import 'package:ping/Core/Services/navigation_service.dart';
import 'package:ping/Routes/app_router.dart';

import 'package:ping/UIs/onboarding/splash_screen.dart';
import 'package:ping/locator.dart';

void main() {
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PING',
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: AppRouter.generateRoutes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
