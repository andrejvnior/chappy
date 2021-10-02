import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projects/models/firebase_model.dart';
import 'package:projects/modules/interests/pages/interest_page.dart';
import 'package:projects/modules/profile/models/gender.dart';
import 'package:projects/modules/profile/pages/create/profile_create_controller.dart';
import 'package:projects/widgets/chappy_button.dart';
import 'package:projects/widgets/chappy_text_input.dart';

class ProfileCreatePage extends StatefulWidget {
  final String email;

  const ProfileCreatePage({Key? key, required this.email}) : super(key: key);

  @override
  _ProfileCreatePageState createState() => _ProfileCreatePageState();
}

class _ProfileCreatePageState extends State<ProfileCreatePage> {
  late ProfileCreateController controller;

  @override
  void initState() {
    controller = ProfileCreateController(widget.email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          return Container(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                ChappyTextInput(
                  hintText: 'Name',
                  onChanged: controller.setName,
                ),
                const SizedBox(height: 16),
                DropdownButton<Gender>(
                  value: controller.gender,
                  icon: const Icon(Icons.arrow_downward),
                  // iconSize: 24,
                  // elevation: 16,
                  isExpanded: true,
                  style: TextStyle(color: Colors.grey.shade500),
                  underline: Container(
                    height: 2,
                    color: Colors.grey.shade500,
                  ),
                  onChanged: (v) => controller.setGender(v!),
                  items:
                      genderList.map<DropdownMenuItem<Gender>>((Gender gender) {
                    return DropdownMenuItem<Gender>(
                      value: gender,
                      child: Text(gender.title ?? 'Select Gender'),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                ChappyTextInput(
                  hintText: controller.birthday.toString(),
                  // onChanged: _controller.setAge,
                ),
                const SizedBox(height: 16),
                ChappyTextInput(
                  hintText: 'City',
                  onChanged: controller.setCity,
                ),
                const SizedBox(height: 16),
                ChappyTextInput(
                  hintText: 'Country',
                  onChanged: controller.setCountry,
                ),
                const SizedBox(height: 16),
                ChappyButton(
                  onPressed: () async {
                    if (controller.isValid) {
                      final result = await controller.createProfile();
                      if (result == SaveResult.success) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InterestPage(
                              profile: controller.profile!,
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
              ],
            ),
          );
        },
      ),
    );
  }
}
