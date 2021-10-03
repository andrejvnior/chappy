import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projects/models/firebase_model.dart';
import 'package:projects/modules/home/pages/home_page.dart';
import 'package:projects/themes/chappy_colors.dart';
import 'package:projects/themes/chappy_texts.dart';
import 'package:projects/widgets/chappy_app_bar.dart';
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75), // Set Set this height
        child: ChappyAppBar(
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SizedBox(
              width: 50,
              child: Text(
                'Sign Up',
                style: ChappyTexts.subtitle2
                    .apply(color: ChappyColors.primaryColor),
              ),
            ),
          ),
          title: 'Sign In',
          actions: [
            Container(width: 50),
          ],
        ),
      ),
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
            GestureDetector(
              onTap: () {
              },
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                child: Text(
                  'Forgot your password?',
                  style: ChappyTexts.caption
                      .apply(color: ChappyColors.primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
