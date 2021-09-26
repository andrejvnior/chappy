import 'package:flutter/material.dart';
import 'package:projects/modules/chat/models/chat.dart';
import 'package:projects/modules/chat/page/read/chat_page.dart';
import 'package:projects/modules/profile/models/profile.dart';

class ChatItem extends StatelessWidget {
  final Chat chat; 
  final Profile? profile;
  const ChatItem({Key? key, required this.chat, this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatPage(
            chat: chat,
            profile: profile,
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
                          chat.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        chat.createdAt.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(chat.description),
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
        ),
      ),
    );
  }
}
