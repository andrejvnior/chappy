import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projects/modules/auth/pages/signup/signup_controller.dart';
import 'package:projects/modules/home/pages/home_page.dart';
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
                ChappyTextInput(
                  hintText: 'Password',
                  onChanged: controller.setPassword,
                  obscureText: true,
                ),
                ChappyTextInput(
                  hintText: 'Name',
                  onChanged: controller.setName,
                ),
                ChappyTextInput(
                  hintText: 'Nickname',
                  onChanged: controller.setNickname,
                ),
                ChappyTextInput(
                  hintText: 'Gender',
                  onChanged: controller.setGender,
                ),
                ChappyTextInput(
                  hintText: 'Bio',
                  onChanged: controller.setBio,
                ),
                ChappyTextInput(
                  hintText: controller.age.toString(),
                  // onChanged: _controller.setAge,
                ),
                const SizedBox(height: 16),
                ChappyButton(
                  onPressed: () async {
                    if (controller.isValid) {
                      controller.setLoading();
                      controller.signUp().then((isProfileCreated) {
                        if (isProfileCreated) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage(
                                        profile: controller.profile,
                                      )));
                        }
                      });
                      controller.setLoading();
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
              ],
            ),
          );
        },
      ),
    );
  }
}
