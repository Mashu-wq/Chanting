import 'package:chanting/colors.dart';
import 'package:chanting/common/widgets/custom_button.dart';
import 'package:chanting/features/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Welcome to Chanting',
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: size.height / 9,
            ),
            Image.asset(
              'assets/images/bg.png',
              height: 340,
              width: 340,
              color: tabColor,
            ),
            SizedBox(
              height: size.height / 9,
            ),
            const Text(
              'Read our Privacy Policy. Tap "Agree and continue" to accept the Terms of Service.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: greyColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                width: size.width * 0.75,
                child: CustomButton(
                    text: 'AGREE AND CONTINUE',
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    }))
          ],
        ),
      )),
    );
  }
}
