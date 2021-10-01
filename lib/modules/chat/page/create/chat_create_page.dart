import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projects/models/firebase_model.dart';
import 'package:projects/modules/chat/models/category.dart';
import 'package:projects/modules/chat/page/create/chat_create_controller.dart';
import 'package:projects/modules/chat/page/read/chat_page.dart';
import 'package:projects/modules/profile/models/profile.dart';
import 'package:projects/themes/chappy_colors.dart';
import 'package:projects/widgets/chappy_button.dart';
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
      appBar: AppBar(
        title: const Text('Criar Chat'),
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
                ChappyTextInput(
                  hintText: 'Title',
                  onChanged: controller.setTitle,
                ),
                ChappyTextInput(
                  hintText: 'Description',
                  onChanged: controller.setDescription,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    itemCount: categoryList.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) return Container();

                      return Observer(
                        builder: (_) => GestureDetector(
                          onTap: () =>
                              controller.setCategory(categoryList[index].id),
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color:
                                  categoryList[index].id == controller.category
                                      ? ChappyColors.primaryColor
                                      : Colors.grey.shade400,
                            ),
                            child: Text(categoryList[index].title),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
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
