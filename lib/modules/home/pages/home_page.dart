import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projects/modules/auth/pages/signin/signin_page.dart';
import 'package:projects/modules/chat/models/chat.dart';
import 'package:projects/modules/chat/page/create/chat_create_page.dart';
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
  final _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chappy'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => _controller.logout().whenComplete(() =>
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInPage()))),
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      bottomNavigationBar: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {},
              child: Text('home'),
            ),
            TextButton(
              onPressed: () {
                print('KKKKKKKKKK');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatPage()));
              },
              child: Text('chafdfdt'),
            ),
          ],
        ),
      ),
      body: Observer(builder: (_) {
        List<Chat> list = _controller.chatList;

        print('List in UI? ${list.length} ');

        if (list.isEmpty) {
          return const Center(
            child: Text('Theres no chat'),
          );
        }

        return Observer(
          builder: (_)=>ListView.builder(
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
              }),
        );
      }),
    );
  }
}
