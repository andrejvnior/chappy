import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projects/modules/chat/models/chat.dart';
import 'package:projects/modules/chat/page/create/chat_create_page.dart';
import 'package:projects/modules/home/pages/home_page.dart';
import 'package:projects/modules/profile/models/profile.dart';
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
      bottomNavigationBar: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: ChappyTextInput(
                  onChanged: controller.setText,
                  hintText: 'Send message',
                ),
              ),
              TextButton(
                onPressed: () => controller.sendMessage(),
                child: Text('Enviar'),
              )
            ],
          )),
      body: widget.chat == null
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
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        print('Message clicked: ${list[index].content}');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Text(list[index].content),
                      ),
                    );
                  });
            }),
    );
  }
}
