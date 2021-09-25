import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projects/modules/auth/pages/splash/splash_page.dart';
import 'package:projects/themes/chappy_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: ChappyColors.primaryColor,
      //
      // fontFamily: 'Georgia',
      // textTheme: const TextTheme(
      //   headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      //   headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      //   bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      // ),
    ),
    home: const SplashPage(),
  ));
}
