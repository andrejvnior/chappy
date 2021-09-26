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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatPage(
                              profile: widget.profile,
                            )));
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
                      profile: widget.profile,
                    ),
                  ),
                ),
                child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      width: 1,
                      color: Colors.grey.shade400,
                    ))),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      list[index].title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    list[index].createdAt.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(list[index].description),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 20,
                          color: Colors.grey.shade400,
                        ),
                      ],
                    )),
              );
            });
      }),
    );
  }
}
