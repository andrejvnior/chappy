import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projects/modules/chat/models/chat.dart';
import 'package:projects/modules/chat/page/create/chat_create_page.dart';
import 'package:projects/modules/chat/page/read/widgets/message_item.dart';
import 'package:projects/modules/home/pages/home_page.dart';
import 'package:projects/modules/profile/models/profile.dart';
import 'package:projects/themes/chappy_colors.dart';
import 'package:projects/widgets/chappy_button.dart';
import 'package:projects/widgets/chappy_text_input.dart';

import 'chat_controller.dart';

class ChatPage extends StatefulWidget {
  final Chat? chat;
  final Profile? profile;

  const ChatPage({Key? key, this.chat, this.profile}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late ChatController controller;
  final textEditingController = TextEditingController();

  @override
  void initState() {
    controller = ChatController(widget.chat, widget.profile);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chappy'),
          actions: [
            widget.chat == null
                ? IconButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChatCreatePage())),
                    icon: const Icon(Icons.create),
                  )
                : IconButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage())),
                    icon: const Icon(Icons.exit_to_app),
                  ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: widget.chat == null
                  ? Container(
                      alignment: Alignment.center,
                      child: ChappyButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChatCreatePage())),
                        title: 'Create chat',
                      ),
                    )
                  : Observer(builder: (_) {
                      final list = controller.messageList;
                      if (list.isEmpty) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.builder(
                          reverse: true,
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, int index) {
                            return MessageItem(
                              message: list[index],
                              profile: widget.profile,
                            );
                          });
                    }),
            ),
            Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ChappyTextInput(
                        controller: textEditingController,
                        onChanged: controller.setText,
                        hintText: 'Send message',
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: ChappyColors.primaryColor,
                      ),
                      onPressed: () => controller
                          .sendMessage()
                          .whenComplete(() => textEditingController.clear()),
                      child: Text('Enviar'),
                    ),
                  ],
                )),
          ],
        ));
  }
}
