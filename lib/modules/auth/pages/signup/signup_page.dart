import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projects/models/firebase_model.dart';
import 'package:projects/modules/auth/pages/signin/signin_page.dart';
import 'package:projects/modules/auth/pages/signup/signup_controller.dart';
import 'package:projects/modules/profile/pages/create/profile_create_page.dart';
import 'package:projects/widgets/chappy_button.dart';
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
      body: Observer(
        builder: (_) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
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
                const SizedBox(height: 16),
                ChappyTextInput(
                  hintText: 'Confirm password',
                  onChanged: controller.setConfirmPassword,
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                ChappyButton(
                  onPressed: () async {
                    print('Email complete: ${controller.email}');
                    print('Password: ${controller.password}');
                    print('Confirm Password: ${controller.confirmPassword}');
                    print('Email: ${controller.email.isNotEmpty}');
                    print('Valid: ${controller.isValid}');
                    print('Valid E-mail: ${controller.emailValid}');
                    print('Valid Password: ${controller.passwordValid}');
                    print(
                        'Valid Confirm Password: ${controller.confirmPasswordValid}');
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
                  title: 'Register',
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
                  child: const Text('Already have an account? Sign In!'),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
