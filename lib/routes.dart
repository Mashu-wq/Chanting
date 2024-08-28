import 'package:chanting/common/widgets/error.dart';
import 'package:chanting/features/auth/screens/login_screen.dart';
import 'package:chanting/features/auth/screens/otp_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case OTPScreen.routeName:
      return MaterialPageRoute(builder: (context) => const OTPScreen());
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(error: 'This page doesn\'t exist.'),
        ),
      );
  }
}
