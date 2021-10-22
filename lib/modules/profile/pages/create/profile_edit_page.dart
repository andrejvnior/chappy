import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projects/models/firebase_model.dart';
import 'package:projects/modules/profile/models/profile.dart';
import 'package:projects/modules/profile/pages/create/profile_create_controller.dart';
import 'package:projects/modules/profile/pages/create/profile_create_page.dart';
import 'package:projects/widgets/chappy_avatar.dart';
import 'package:projects/widgets/chappy_camera_options.dart';
import 'package:projects/widgets/chappy_text_input.dart';

class ProfileEditPage extends StatefulWidget {
  final Profile profile;

  const ProfileEditPage({Key? key, required this.profile}) : super(key: key);

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  late ProfileCreateController controller;

  @override
  void initState() {
    controller =
        ProfileCreateController(widget.profile.email, profile: widget.profile);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        actions: [
          TextButton(
            onPressed: () async {
              final result = await controller.updateProfile();
              if (result == SaveResult.success) {
                Navigator.pop(context, controller.profile);
              } else {
                controller.setErrorMessage();
              }
            },
            child: const Text(
              'Salvar',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return Container(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                Observer(
                  builder: (_) => ChappyAvatar(
                    image: controller.profile?.picture,
                    file: controller.imageFile,
                  ),
                ),
                TextButton(
                  onPressed: () => showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) => ChappyCameraOptions(
                          onSelected: controller.takePicture)),
                  child: const Text('Take Picture'),
                ),
                Observer(
                  builder: (_) {
                    return ChappyTextInput(
                      hintText: 'Nickname',
                      onChanged: controller.setNickname,
                      errorMessage: controller.errorMessage,
                    );
                  },
                ),
                const SizedBox(height: 16),
                ChappyTextInput(
                  hintText: controller.bio,
                  onChanged: controller.setBio,
                ),
                if (controller.errorMessage.isNotEmpty)
                  const Text('Error editing profile...'),
                TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProfileCreatePage(email: widget.profile.email))),
                  child: const Text('Edit personal information'),
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
