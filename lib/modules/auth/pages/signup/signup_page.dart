import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projects/models/firebase_model.dart';
import 'package:projects/modules/auth/pages/signin/signin_page.dart';
import 'package:projects/modules/auth/pages/signup/signup_controller.dart';
import 'package:projects/modules/profile/pages/create/profile_create_page.dart';
import 'package:projects/themes/chappy_colors.dart';
import 'package:projects/themes/chappy_texts.dart';
import 'package:projects/widgets/chappy_app_bar.dart';
import 'package:projects/widgets/chappy_button.dart';
import 'package:projects/widgets/chappy_squared_checkbox.dart';
import 'package:projects/widgets/chappy_text_input.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final SignUpController controller = SignUpController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(75), // Set  Set this height
        child: ChappyAppBar(
          title: 'Sign Up',
        ),
      ),
      body: Observer(
        builder: (_) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16),
            child: ListView(
              shrinkWrap: true,
              children: [
                ChappyTextInput(
                  hintText: 'Email',
                  onChanged: controller.setEmail,
                ),
                const SizedBox(height: 16),
                ChappyTextInput(
                  hintText: 'Password',
                  onChanged: controller.setPassword,
                  isPassword: true,
                ),
                const SizedBox(height: 16),
                ChappyTextInput(
                  hintText: 'Confirm password',
                  onChanged: controller.setConfirmPassword,
                  isPassword: true,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Observer(
                      builder: (_) => ChappySquaredCheckbox(
                        onPressed: () => controller.toggleAgreed(),
                        isSelected: controller.agreed,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'I agree to the ',
                      style: ChappyTexts.caption
                          .apply(color: ChappyColors.grey900),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Terms',
                        style: ChappyTexts.caption
                            .apply(color: ChappyColors.primaryColor),
                      ),
                    ),
                    Text(
                      ' and ',
                      style: ChappyTexts.caption
                          .apply(color: ChappyColors.grey900),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Conditions',
                        style: ChappyTexts.caption
                            .apply(color: ChappyColors.primaryColor),
                      ),
                    ),
                    Text(
                      '.',
                      style: ChappyTexts.caption
                          .apply(color: ChappyColors.grey900),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ChappyButton(
                  onPressed: () async {
                    if (controller.isValid) {
                      final result = await controller.signUp();
                      if (result == SaveResult.success) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileCreatePage(
                              email: controller.email,
                            ),
                          ),
                        );
                      }
                    } else {
                      controller.setErrorMessage();
                    }
                  },
                  title: 'Sign Up',
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
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInPage())),
                  child: Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: ChappyTexts.caption
                              .apply(color: ChappyColors.grey900),
                        ),
                        Text(
                          'Sign In',
                          style: ChappyTexts.caption
                              .apply(color: ChappyColors.primaryColor),
                        ),
                        Text(
                          '!',
                          style: ChappyTexts.caption
                              .apply(color: ChappyColors.grey900),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
