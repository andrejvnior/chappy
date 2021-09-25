import 'dart:async';
import 'package:flutter/material.dart';
import 'package:projects/modules/auth/pages/signin/signin_page.dart';
import 'package:projects/modules/home/pages/home_page.dart';
import 'package:projects/themes/chappy_colors.dart';

import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashController _controller = SplashController();

  @override
  void initState() {
    super.initState();
    navigateUser();
  }

  navigateUser() async {
    print('Navigating... ${_controller.isLogged}');
    if (_controller.isLogged) {
      await _controller.getProfile();
      Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomePage(profile: _controller.profile)),
            (Route<dynamic> route) => false),
      );
    } else {
      Timer(
          const Duration(seconds: 4),
          () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => const SignInPage())));
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
