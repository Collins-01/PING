import 'package:flutter/material.dart';
import 'package:ping/Core/Services/auth_service.dart';
import 'package:ping/UIs/home/messages_view.dart';
import 'package:ping/UIs/onboarding/sign_in_view.dart';
import 'package:ping/Utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2));
    _onLoad();
    super.initState();
  }

  _onLoad() async {
    await AuthService.onAppLoad();
    if (AuthService.user == null) {
      //navigate to join
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const SignInView()));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const MessagesView()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: const Center(
        child: Text("Loading...."),
      ),
    );
  }
}
