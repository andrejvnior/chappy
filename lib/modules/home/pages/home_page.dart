import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projects/modules/auth/pages/signin/signin_page.dart';
import 'package:projects/modules/chat/page/read/chat_page.dart';
import 'package:projects/modules/profile/models/profile.dart';

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
    controller = HomeController();
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatPage(profile: widget.profile,)));
              },
              child: const Text('chat'),
            ),
          ],
        ),
      ),
      body: Observer(builder: (_) {
        final list = controller.chatList;

        if (list.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatPage(
                      chat: list[index],
                    ),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(list[index].title),
                      Text(list[index].description),
                    ],
                  ),
                ),
              );
            });
      }),
    );
  }
}
