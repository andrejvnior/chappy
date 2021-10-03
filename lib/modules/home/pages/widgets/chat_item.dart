import 'package:flutter/material.dart';
import 'package:projects/core/extensions.dart';
import 'package:projects/modules/chat/models/chat.dart';
import 'package:projects/modules/profile/models/profile.dart';
import 'package:projects/themes/chappy_colors.dart';
import 'package:projects/themes/chappy_texts.dart';

class ChatItem extends StatelessWidget {
  final Chat chat;
  final Profile? profile;
  final VoidCallback? onPressed;

  const ChatItem({Key? key, required this.chat, this.profile, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
          width: 1,
          color: ChappyColors.grey100,
        ))),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: ChappyColors.grey300,
                  borderRadius: BorderRadius.circular(8)),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          chat.title,
                          style: ChappyTexts.subtitle1,
                        ),
                      ),
                      Text(chat.createdAt.hourAndMinute.toString(),
                          style: ChappyTexts.caption
                              .apply(color: ChappyColors.grey900)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(chat.description, style: ChappyTexts.caption),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
