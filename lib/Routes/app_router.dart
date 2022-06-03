import 'package:flutter/material.dart';
import 'package:ping/Core/Models/contact_model.dart';
import 'package:ping/Routes/navigator_routes.dart';
import 'package:ping/UIs/home/chat_view.dart';
import 'package:ping/UIs/home/messages_view.dart';
import 'package:ping/UIs/onboarding/sign_in_view.dart';
import 'package:ping/UIs/onboarding/verification_view.dart';

class AppRouter {
  static PageRoute _getPageRoute(
    Widget viewToShow, {
    RouteSettings? settings,
    Object? arguments,
  }) {
    return MaterialPageRoute(builder: (context) => viewToShow);
  }

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      //* SignIN View
      case NavigatorRoutes.signInView:
        return _getPageRoute(const SignInView());

// *Splashscreen
      case NavigatorRoutes.splashscreen:
        return _getPageRoute(const SignInView());
// *Chat View
      case NavigatorRoutes.chatView:
        var contact = settings.arguments as Contact;
        return _getPageRoute(ChatView(
          contact: contact,
        ));
      // * Messages View
      case NavigatorRoutes.messagesView:
        return _getPageRoute(const MessagesView());
      case NavigatorRoutes.verificationView:
        return _getPageRoute(const VerificationView());

      default:
        return _getPageRoute(Scaffold(
          body: Center(
            child: Text("No routes defined for ${settings.name}"),
          ),
        ));
    }
  }
}
// SplashScreen