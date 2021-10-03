import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projects/models/firebase_model.dart';
import 'package:projects/modules/chat/page/create/chat_create_controller.dart';
import 'package:projects/modules/chat/page/read/chat_page.dart';
import 'package:projects/modules/interests/models/interest.dart';
import 'package:projects/modules/interests/pages/interest_page.dart';
import 'package:projects/modules/profile/models/profile.dart';
import 'package:projects/themes/chappy_colors.dart';
import 'package:projects/themes/chappy_texts.dart';
import 'package:projects/widgets/chappy_app_bar.dart';
import 'package:projects/widgets/chappy_button.dart';
import 'package:projects/widgets/chappy_camera_options.dart';
import 'package:projects/widgets/chappy_text_input.dart';

class ChatCreatePage extends StatefulWidget {
  final Profile? profile;

  const ChatCreatePage({Key? key, this.profile}) : super(key: key);

  @override
  _ChatCreatePageState createState() => _ChatCreatePageState();
}

class _ChatCreatePageState extends State<ChatCreatePage> {
  late ChatCreateController controller;

  @override
  void initState() {
    controller = ChatCreateController(widget.profile);
    super.initState();
  }

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
                'Back',
                style: ChappyTexts.subtitle2
                    .apply(color: ChappyColors.primaryColor),
              ),
            ),
          ),
          title: 'Create chat',
          actions: [
            Container(width: 50),
          ],
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
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Observer(
                  builder: (_) => GestureDetector(
                    onTap: () => showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) => ChappyCameraOptions(
                            onSelected: controller.takePicture)),
                    child: Observer(
                      builder: (_) => Container(
                        width: 100,
                        height: 100,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: ChappyColors.grey100,
                          border: Border.all(color: ChappyColors.grey),
                          borderRadius: BorderRadius.circular(100),
                          image: controller.imageFile != null
                              ? DecorationImage(
                                  image: FileImage(
                                    controller.imageFile!,
                                  ),
                                  fit: BoxFit.cover,
                                  scale: 12,
                                )
                              : const DecorationImage(
                                  //TODO: Change default image
                                  image: NetworkImage(
                                    'https://cdn3.iconfinder.com/data/icons/linecons-free-vector-icons-pack/32/camera-512.png',
                                  ),
                                  scale: 12,
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ChappyTextInput(
                  hintText: 'Title',
                  onChanged: controller.setTitle,
                ),
                const SizedBox(height: 16),
                ChappyTextInput(
                  hintText: 'Description',
                  onChanged: controller.setDescription,
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () async {
                    final category = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InterestPage(
                          profile: controller.profile!,
                          isSelection: true,
                        ),
                      ),
                    );
                    controller.setCategory(category as int);
                  },
                  child: Observer(
                    builder: (_) => Container(
                      alignment: Alignment.center,
                      child: Text(
                        controller.category != 0
                            ? 'Category selected: ${interestList.firstWhere((interest) => interest.id == controller.category).title}'
                            : 'Select a category',
                        style: ChappyTexts.subtitle2
                            .apply(color: ChappyColors.primaryColor),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                ChappyButton(
                  onPressed: () async {
                    if (controller.isValid) {
                      final result = await controller.createChat();

                      if (result == SaveResult.success) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatPage(
                                      chat: controller.chat,
                                      profile: widget.profile,
                                    )));
                      }
                    } else {
                      controller.setErrorMessage();
                    }
                  },
                  title: 'Create',
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
