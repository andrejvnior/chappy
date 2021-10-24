import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projects/modules/auth/pages/splash/splash_page.dart';
import 'package:projects/modules/chat/page/read/chat_controller.dart';
import 'package:projects/modules/home/pages/home_page.dart';
import 'package:projects/modules/profile/pages/read/profile_page.dart';
import 'package:projects/widgets/chappy_button.dart';
import 'package:projects/widgets/chappy_list_tile.dart';
import 'package:projects/widgets/chappy_title.dart';

class ChatDrawer extends StatelessWidget {
  final ChatController controller;

  const ChatDrawer({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                ProfilePage(
                                    profile: user,
                                    other: list[index]),
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
              onPressed: () =>
                  controller.exit().whenComplete(
                        () =>
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomePage(
                                      profile: user,
                                    ))),
                  ),
              title: 'Get out',
            )
          ],
        );
      }),
    );
  }
}
