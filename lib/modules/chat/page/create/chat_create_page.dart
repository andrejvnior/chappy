import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projects/modules/chat/page/create/chat_create_controller.dart';
import 'package:projects/modules/chat/page/read/chat_page.dart';
import 'package:projects/modules/profile/models/profile.dart';
import 'package:projects/widgets/chappy_button.dart';
import 'package:projects/widgets/chappy_text_input.dart';

class ChatCreatePage extends StatefulWidget {
  final Profile? profile;
  const ChatCreatePage({Key? key, this.profile}) : super(key: key);

  @override
  _ChatCreatePageState createState() => _ChatCreatePageState();
}

class _ChatCreatePageState extends State<ChatCreatePage> {
  final _controller = ChatCreateController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Chat'),
      ),
      body: Observer(
        builder: (_) {
          if (_controller.isLoading) {
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
                  onChanged: _controller.setTitle,
                ),
                ChappyTextInput(
                  hintText: 'Description',
                  onChanged: _controller.setDescription,
                ),
                const SizedBox(height: 16),
                ChappyButton(
                  onPressed: () async {
                    if (_controller.isValid) {
                      _controller.createChat().then((isChatCreated) {
                        if (isChatCreated) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatPage(
                                    chat: _controller.chat,
                                    profile: widget.profile,
                                  )));
                        }
                      });
                    } else {
                      _controller.setErrorMessage();
                    }
                  },
                  title: 'Create',
                ),
                Observer(
                  builder: (_) {
                    if (_controller.errorMessage.isEmpty) return Container();

                    return Text(
                      _controller.errorMessage,
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
