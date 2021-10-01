import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projects/models/firebase_model.dart';
import 'package:projects/modules/auth/pages/signup/signup_page.dart';
import 'package:projects/modules/home/pages/home_page.dart';
import 'package:projects/widgets/chappy_button.dart';
import 'package:projects/widgets/chappy_text_input.dart';

import 'signin_controller.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final SignInController controller = SignInController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ChappyTextInput(
              hintText: 'Email',
              onChanged: controller.setEmail,
            ),
            const SizedBox(height: 16),
            ChappyTextInput(
              hintText: 'Password',
              onChanged: controller.setPassword,
              obscureText: true,
            ),
            Observer(
              builder: (_) {
                if (controller.errorMessage.isEmpty) return Container();

                return Text(
                  controller.errorMessage,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            ChappyButton(
              onPressed: () async {
                if (controller.isValid) {
                  final result = await controller.signIn();

                  if (result == SaveResult.success) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(
                          profile: controller.profile,
                        ),
                      ),
                    );
                  }
                } else {
                  controller.setErrorMessage();
                }
              },
              title: 'Sign In',
            ),
            TextButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignUpPage())),
              child: const Text('Don\'t you have an account? Register'),
            ),
          ],
        ),
      ),
    );
  }
}
