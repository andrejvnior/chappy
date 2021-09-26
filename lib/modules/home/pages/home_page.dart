import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projects/modules/auth/pages/signin/signin_page.dart';
import 'package:projects/modules/chat/models/category.dart';
import 'package:projects/modules/chat/page/read/chat_page.dart';
import 'package:projects/modules/home/pages/widgets/chat_item.dart';
import 'package:projects/modules/profile/models/profile.dart';
import 'package:projects/themes/chappy_colors.dart';
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
                      profile: widget.profile,
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
          const ChappyTitle(title: 'Chats'),
          const SizedBox(height: 16),
          SizedBox(
            height: 36,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryList.length,
              itemBuilder: (BuildContext context, int index) {
                return Observer(
                  builder: (_) => GestureDetector(
                    onTap: () => controller.setCategory(categoryList[index].id),
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: categoryList[index].id == controller.category
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
                                        profile: widget.profile,
                                      ),
                                    ),
                                  ));
                        },
                        chat: list[index],
                        profile: widget.profile);
                  });
            }),
          ),
        ],
      ),
    );
  }
}
