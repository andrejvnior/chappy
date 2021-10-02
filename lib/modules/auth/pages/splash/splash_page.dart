import 'dart:async';
import 'package:flutter/material.dart';
import 'package:projects/modules/auth/pages/signup/signup_page.dart';
import 'package:projects/modules/home/pages/home_page.dart';
import 'package:projects/modules/profile/pages/create/profile_create_page.dart';
import 'package:projects/themes/chappy_colors.dart';

import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashController controller = SplashController();

  @override
  void initState() {
    super.initState();
    navigateUser();
  }

  navigateUser() async {
    if (controller.isLogged) {
      final profile = await controller.getProfile();

      if (profile == null) {
        Timer(
          const Duration(seconds: 3),
          () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => ProfileCreatePage(
                      email: controller.auth.currentUser?.email ?? '')),
              (Route<dynamic> route) => false),
        );
      } else {
        Timer(
          const Duration(seconds: 3),
          () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => HomePage(profile: profile)),
              (Route<dynamic> route) => false),
        );
      }
    } else {
      Timer(
          const Duration(seconds: 4),
          () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SignUpPage())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: ChappyColors.primaryColor,
        body: Center(
          child: Text(
            "Chappy",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
