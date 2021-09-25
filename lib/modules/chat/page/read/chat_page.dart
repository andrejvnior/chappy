import 'package:flutter/material.dart';
import 'package:projects/modules/chat/models/chat.dart';
import 'package:projects/modules/chat/page/create/chat_create_page.dart';

class ChatPage extends StatefulWidget {
  final Chat? chat;

  const ChatPage({Key? key, this.chat}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chappy'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ChatCreatePage())),
            icon: const Icon(Icons.create),
          )
        ],
      ),
      body: Container(
        child: Text('Welcome to the chat ${widget.chat?.title}'),
      ),
    );
  }
}
