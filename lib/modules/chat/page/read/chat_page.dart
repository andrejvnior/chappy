import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projects/modules/chat/models/chat.dart';
import 'package:projects/modules/chat/page/create/chat_create_page.dart';
import 'package:projects/modules/chat/page/read/widgets/message_item.dart';
import 'package:projects/modules/home/pages/home_page.dart';
import 'package:projects/modules/profile/models/profile.dart';
import 'package:projects/modules/profile/pages/read/profile_page.dart';
import 'package:projects/themes/chappy_colors.dart';
import 'package:projects/widgets/chappy_button.dart';
import 'package:projects/widgets/chappy_list_tile.dart';
import 'package:projects/widgets/chappy_text_input.dart';
import 'package:projects/widgets/chappy_title.dart';

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
          title: const Text('Chat'),
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
                                builder: (context) => ChatCreatePage(
                                      profile: widget.profile,
                                    ))),
                        title: 'Create chat',
                      ),
                    )
                  : Observer(builder: (_) {
                      final list = controller.messages;
                      if (list.isEmpty) {
                        return const Center(
                          child: Text('No messages yet.'),
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
            Observer(
              builder: (_) {
                if (controller.private) {
                  return SizedBox(
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        const ChappyTitle(
                          title: 'Search profile',
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: Observer(
                            builder: (_) {
                              final list = controller.profiles;
                              if (list.isEmpty) {
                                return Container();
                              }
                              return ListView.builder(
                                  itemCount: list.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ChappyListTile(
                                      leading: Image.network(
                                        'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png',
                                        width: 20,
                                      ),
                                      title: Text(list[index].name),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 20,
                                        color: Colors.grey.shade400,
                                      ),
                                    );
                                  });
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Container();
              },
            ),
            Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Observer(
                        builder: (_) => ChappyTextInput(
                          onChanged: controller.private
                              ? controller.setSearch
                              : controller.setText,
                          hintText: 'Send message',
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: ChappyColors.primaryColor,
                      ),
                      onPressed: () => controller
                          .sendMessage()
                          .whenComplete(() => textEditingController.clear()),
                      child: const Text('Enviar'),
                    ),
                  ],
                )),
          ],
        ),
        drawer: Drawer(
          child: Observer(builder: (_) {
            final list = controller.profiles;

            if (list.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const SizedBox(height: 16),
                ChappyTitle(
                  title: 'Online (${list.length})',
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        // TODO: Substitute image
                        return ChappyListTile(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ProfilePage(
                                    profile: widget.profile!, other: list[index]),
                              ),
                            );
                          },
                          title: Text(list[index].name),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 20,
                            color: Colors.grey.shade400,
                          ),
                        );
                      }),
                ),
                ChappyButton(
                  onPressed: () => controller.exit().whenComplete(
                        () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage(
                                      profile: widget.profile,
                                    ))),
                      ),
                  title: 'Get out',
                )
              ],
            );
          }),
        ));
  }
}
