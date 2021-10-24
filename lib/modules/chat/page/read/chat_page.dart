import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projects/modules/chat/models/chat.dart';
import 'package:projects/modules/chat/models/content_item.dart';
import 'package:projects/modules/chat/page/create/chat_create_page.dart';
import 'package:projects/modules/chat/page/read/components/chat_drawer.dart';
import 'package:projects/modules/chat/page/read/components/chat_input.dart';
import 'package:projects/modules/chat/page/read/widgets/message_item.dart';
import 'package:projects/modules/profile/models/profile.dart';
import 'package:projects/modules/profile/pages/read/profile_page.dart';
import 'package:projects/themes/chappy_colors.dart';
import 'package:projects/themes/chappy_icons.dart';
import 'package:projects/themes/chappy_texts.dart';
import 'package:projects/widgets/chappy_avatar.dart';
import 'package:projects/widgets/chappy_button.dart';
import 'package:projects/widgets/chappy_icon.dart';
import 'package:projects/widgets/chappy_list_tile.dart';
import 'package:projects/widgets/chappy_squared_checkbox.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final list = <ContentItem>[];
  final dividers = <ContentItem>[];

  @override
  void initState() {
    controller = ChatController(widget.chat, widget.profile);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Observer(
              builder: (_) {
                if (controller.search.isNotEmpty) {
                  return const Text(
                    'Search users',
                    style: ChappyTexts.headline6,
                    textAlign: TextAlign.center,
                  );
                }

                return Row(
                  children: [
                    ChappyIcon(
                      onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                      icon: ChappyIcons.users,
                      color: ChappyColors.primaryColor,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: SizedBox(
                        height: 32,
                        child: Stack(
                          children: [
                            Observer(
                              builder: (_) {
                                final profiles = controller.profiles;

                                if (profiles.isEmpty) return Container();

                                return ListView.builder(
                                    itemCount: profiles.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ChappyAvatar(
                                        onPressed: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ProfilePage(
                                                profile: profiles[index]),
                                          ),
                                        ),
                                        image: profiles[index].picture,
                                        margin: const EdgeInsets.only(right: 4),
                                      );
                                    });
                              },
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              bottom: 0,
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: 16,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.white,
                                          Colors.white.withOpacity(0),
                                        ],
                                        stops: const [0, 0.95],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              bottom: 0,
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.centerRight,
                                    width: 16,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.white.withOpacity(0),
                                          Colors.white,
                                        ],
                                        stops: const [0, 0.95],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ChappyIcon(
                      onPressed: () {},
                      icon: ChappyIcons.search,
                      color: ChappyColors.primaryColor,
                    ),
                  ],
                );
              },
            ),
          ),
          preferredSize: const Size.fromHeight(80.0),
        ),
        body: Column(children: [
          Observer(
            builder: (_) {
              final profiles = controller.profiles;

              if (controller.search.isNotEmpty &&
                  controller.profiles.isNotEmpty) {
                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      const ChappyTitle(
                        title: 'Search profile',
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView.builder(
                            itemCount: profiles.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ChappyListTile(
                                onPressed: () => controller
                                    .setRecipient(profiles[index].nickname),
                                leading: Image.network(
                                  'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png',
                                  width: 20,
                                ),
                                title: Text(profiles[index].name),
                                trailing: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 20,
                                  color: Colors.grey.shade400,
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                );
              }

              return Expanded(
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
                        final messages = controller.messages;

                        if (messages.isEmpty) {
                          return const Center(
                            child: Text('No messages yet.'),
                          );
                        }

                        list.clear();
                        dividers.clear();

                        for (final message in messages) {
                          list.add(MessageItem(
                            message: message,
                            profile: profiles.firstWhere(
                                (profile) => profile.uuid == message.createdBy),
                            isProfile:
                                message.createdBy == widget.profile?.uuid,
                            position: MessagePosition.middle,
                          ));
                        }

                        for (int index = 0; index < messages.length; index++) {
                          final nextItem =
                              list[index + 1 < list.length ? index + 1 : index];

                          final prevItem =
                              list[index - 1 >= 0 ? index - 1 : index];

                          final isLastMessage =
                              list[index].createdBy != nextItem.createdBy;

                          final isFirstMessage =
                              list[index].createdBy != prevItem.createdBy;

                          final isSoloMessage = isFirstMessage && isLastMessage;

                          if (isLastMessage) {
                            list[index] = MessageItem(
                              message: messages.firstWhere((message) =>
                                  message.createdAt == list[index].createdAt),
                              profile: profiles.firstWhere((profile) =>
                                  profile.uuid == list[index].createdBy),
                              isProfile:
                                  list[index].createdBy == widget.profile?.uuid,
                              position: MessagePosition.first,
                            );
                          }

                          if (isFirstMessage) {
                            list[index] = MessageItem(
                              message: messages.firstWhere((message) =>
                                  message.createdAt == list[index].createdAt),
                              profile: profiles.firstWhere((profile) =>
                                  profile.uuid == list[index].createdBy),
                              isProfile:
                                  list[index].createdBy == widget.profile?.uuid,
                              position: MessagePosition.last,
                            );
                          }

                          if (isSoloMessage) {
                            list[index] = MessageItem(
                              message: messages.firstWhere((message) =>
                                  message.createdAt == list[index].createdAt),
                              profile: profiles.firstWhere((profile) =>
                                  profile.uuid == list[index].createdBy),
                              isProfile:
                                  list[index].createdBy == widget.profile?.uuid,
                              position: MessagePosition.middle,
                              isSolo: true,
                            );
                          }

                          list[0] = MessageItem(
                            message: messages.firstWhere((message) =>
                                message.createdAt == list[0].createdAt),
                            profile: profiles.firstWhere((profile) =>
                                profile.uuid == list[index].createdBy),
                            isProfile:
                                list[0].createdBy == widget.profile?.uuid,
                            position: MessagePosition.last,
                          );

                          // if (!dividers.any((d) => d.createdAt
                          //     .isSameMinuteAs(list[index].createdAt))) {
                          //   dividers.add(
                          //     MessageDividerItem(
                          //       list[index].createdAt,
                          //     ),
                          //   );
                          // }
                        }

                        // dividers.removeAt(0);

                        // list.addAll(dividers);

                        list.sort((b, a) => a.compareTo(b));

                        return ListView.builder(
                            reverse: true,
                            itemCount: list.length,
                            itemBuilder: (BuildContext context, int index) {
                              return list[index];
                            });
                      }),
              );
            },
          ),
          Observer(
            builder: (_) {
              if (controller.recipient.isNotEmpty) {
                return Container(
                    height: 50,
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        ChappySquaredCheckbox(
                          isSelected: controller.isPrivate,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Private message',
                          style: ChappyTexts.body2,
                        ),
                      ],
                    ));
              }
              return Container();
            },
          ),
          Observer(
            builder: (_) => ChatInput(
              controller: controller,
            ),
          ),
        ]),
        drawer: ChatDrawer(
          controller: controller,
        ),
      ),
    );
  }
}
