import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projects/modules/auth/pages/signin/signin_page.dart';
import 'package:projects/modules/chat/page/read/chat_page.dart';
import 'package:projects/modules/home/pages/widgets/chat_item.dart';
import 'package:projects/modules/interests/models/interest.dart';
import 'package:projects/modules/interests/pages/interest_page.dart';
import 'package:projects/modules/profile/models/profile.dart';
import 'package:projects/modules/profile/pages/read/profile_page.dart';
import 'package:projects/themes/chappy_colors.dart';
import 'package:projects/widgets/chappy_avatar.dart';
import 'package:projects/widgets/chappy_title.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final Profile? profile;

  const HomePage({Key? key, this.profile}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController controller;

  @override
  void initState() {
    controller = HomeController(widget.profile);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('Chappy'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => controller.logout().whenComplete(() =>
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInPage()))),
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text('home'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatPage(
                      profile: controller.profile,
                    ),
                  ),
                );
              },
              child: const Text('chat'),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          ChappyAvatar(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(profile: controller.profile!),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InterestPage(
                    profile: controller.profile!,
                    interests: controller.profile?.interests,
                  ),
                )),
            child: const Text('Add interest'),
          ),
          SizedBox(
              height: 36,
              child: Observer(
                builder: (_) {
                  if (controller.interests.isEmpty) return Container();
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.interests.length,
                    itemBuilder: (BuildContext context, int index) {
                      final title = interestList
                          .firstWhere((interest) =>
                              interest.id == controller.interests[index])
                          .title;
                      return Observer(
                        builder: (_) => GestureDetector(
                          onTap: () => controller
                              .setInterest(controller.interests[index]),
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: controller.interests[index] ==
                                      controller.interest
                                  ? ChappyColors.primaryColor
                                  : Colors.grey.shade400,
                            ),
                            child: Text(title ?? ''),
                          ),
                        ),
                      );
                    },
                  );
                },
              )),
          const SizedBox(height: 16),
          const ChappyTitle(title: 'Chats'),
          const SizedBox(height: 16),
          Expanded(
            child: Observer(builder: (_) {
              final list = controller.chats;

              if (list.isEmpty) {
                return const Center(
                  child: Text('No chats found.'),
                );
              }

              return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ChatItem(
                        onPressed: () {
                          controller
                              .createMember(list[index])
                              .whenComplete(() => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ChatPage(
                                        chat: list[index],
                                        profile: controller.profile,
                                      ),
                                    ),
                                  ));
                        },
                        chat: list[index],
                        profile: controller.profile);
                  });
            }),
          ),
        ],
      ),
    );
  }
}
