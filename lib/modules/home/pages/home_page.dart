import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projects/modules/chat/page/read/chat_page.dart';
import 'package:projects/modules/home/pages/widgets/chat_item.dart';
import 'package:projects/modules/interests/models/interest.dart';
import 'package:projects/modules/interests/pages/interest_page.dart';
import 'package:projects/modules/profile/models/profile.dart';
import 'package:projects/modules/profile/pages/read/profile_page.dart';
import 'package:projects/themes/chappy_colors.dart';
import 'package:projects/themes/chappy_icons.dart';
import 'package:projects/themes/chappy_texts.dart';
import 'package:projects/widgets/chappy_app_bar.dart';
import 'package:projects/widgets/chappy_avatar.dart';
import 'package:projects/widgets/chappy_icon.dart';
import 'package:projects/widgets/chappy_text_input.dart';

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: ChappyAppBar(
          leading: Row(
            children: [
              ChappyAvatar(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProfilePage(profile: controller.profile!),
                  ),
                ),
                image: controller.profile?.picture,
              ),
              const SizedBox(width: 16),
            ],
          ),
          title: 'Chappy',
          titleStyle: ChappyTexts.brand.apply(color: ChappyColors.primaryColor),
          actions: [
            // TODO: Change provisional icons
            Stack(
              children: [
                ChappyIcon(
                  onPressed: () {},
                  icon: ChappyIcons.mention,
                  color: ChappyColors.grey900,
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: Container(
                    alignment: Alignment.center,
                    width: 13,
                    height: 13,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      '7',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 8,
                        letterSpacing: 0.15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ChappyIcon(
              onPressed: () {},
              icon: ChappyIcons.filter,
              color: ChappyColors.grey900,
            ),
          ],
        ),
      ),
      // TODO: Implement dynamic bottom bar
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ChappyIcon(
              onPressed: () {},
              icon: ChappyIcons.home,
              color: ChappyColors.primaryColor,
            ),
            ChappyIcon(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(
                    profile: controller.profile,
                  ),
                ),
              ),
              icon: ChappyIcons.chat,
              color: ChappyColors.grey900,
            ),
            ChappyIcon(
              onPressed: () {},
              icon: ChappyIcons.message,
              color: ChappyColors.grey900,
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Observer(
                builder: (_) => ChappyTextInput(
                  hintText: 'Search for chat rooms...',
                  suffixIcon: const ChappyIcon(
                    icon: ChappyIcons.search,
                    color: ChappyColors.grey,
                  ),
                  onChanged: controller.setSearchText,
                  borderRadius: BorderRadius.circular(50),
                ),
              )),
          const SizedBox(height: 16),
          SizedBox(
              height: 36,
              child: Observer(
                builder: (_) {
                  if (controller.interests.isEmpty) return Container();

                  List<Widget> bulletList = [];

                  bulletList.add(
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InterestPage(
                            profile: controller.profile!,
                            interests: controller.profile?.interests,
                          ),
                        ),
                      ),
                      child: Container(
                        width: 36,
                        margin: const EdgeInsets.only(left: 16, right: 8),
                        decoration: BoxDecoration(
                            color: ChappyColors.primaryColor,
                            borderRadius: BorderRadius.circular(50)),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                  for (final interest in controller.interests) {
                    final title =
                        interestList.firstWhere((i) => i.id == interest).title;
                    bulletList.add(Observer(
                      // TODO: Create widget called ChappyBullet
                      builder: (_) => GestureDetector(
                        onTap: () => controller.setInterest(interest),
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: interest == controller.interest
                                ? ChappyColors.primaryColor
                                : ChappyColors.grey300,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            (title ?? '').toUpperCase(),
                            style: ChappyTexts.button2.apply(
                              color: interest == controller.interest
                                  ? Colors.white
                                  : ChappyColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ));
                  }
                  bulletList.add(const SizedBox(width: 8));
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: bulletList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return bulletList[index];
                    },
                  );
                },
              )),
          const SizedBox(height: 24),
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
