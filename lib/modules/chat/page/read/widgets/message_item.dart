import 'package:flutter/material.dart';
import 'package:projects/core/extensions.dart';
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
    final bool isProfile = message.createdBy == profile?.uuid;

    return Row(
      children: [
        if (isProfile)
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                message.createdAt.hourAndMinute,
                style: const TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        Align(
          alignment: isProfile ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.75,
              ),
              decoration: BoxDecoration(
                  color: isProfile
                      ? ChappyColors.primaryColor.withOpacity(0.2)
                      : Colors.grey.withOpacity(0.2),
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
                crossAxisAlignment: isProfile
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Text(message.content),
                ],
              )),
        ),
        if (!isProfile)
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                message.createdAt.hourAndMinute,
                style: const TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
