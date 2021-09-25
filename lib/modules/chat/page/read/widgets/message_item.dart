import 'package:flutter/material.dart';
import 'package:projects/modules/chat/models/message.dart';
import 'package:projects/modules/profile/models/profile.dart';
import 'package:projects/themes/chappy_colors.dart';

class MessageItem extends StatelessWidget {
  final Message message;
  final Profile? profile;

  const MessageItem({Key? key, required this.message, this.profile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Message created by: ${message.createdBy}');
    print('Profile ID: ${profile?.uuid}');
    final bool isProfile = message.createdBy == profile?.uuid;

    return Align(
      alignment: isProfile ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
              color: isProfile
                  ? ChappyColors.primaryColor.withOpacity(0.25)
                  : Colors.grey.withOpacity(0.25),
              borderRadius: BorderRadius.only(
                topLeft: isProfile
                    ? const Radius.circular(12)
                    : const Radius.circular(0),
                topRight: isProfile
                    ? const Radius.circular(0)
                    : const Radius.circular(12),
                bottomLeft: const Radius.circular(12),
                bottomRight: const Radius.circular(12),
              )),
          child: Column(
            crossAxisAlignment:
                isProfile ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(message.content),
              const SizedBox(height: 8),
              Text(message.createdAt.toString()),
            ],
          )),
    );
  }
}
