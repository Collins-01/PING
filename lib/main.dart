// ignore_for_file: missing_required_param

import 'package:flutter/material.dart';
import 'package:ping/Core/Services/navigation_service.dart';
import 'package:ping/Routes/app_router.dart';

import 'package:ping/UIs/onboarding/splash_screen.dart';
import 'package:ping/Utils/app_theme.dart';
import 'package:ping/locator.dart';

void main() async {
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PING',
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: AppRouter.generateRoutes,
      theme: AppThemeData.lightThemeData,
      home: const SplashScreen(),
    );
  }
}
