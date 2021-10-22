import 'package:flutter/material.dart';
import 'package:projects/core/extensions.dart';
import 'package:projects/modules/chat/models/content_item.dart';
import 'package:projects/modules/chat/models/message.dart';
import 'package:projects/modules/profile/models/profile.dart';
import 'package:projects/modules/profile/pages/read/profile_page.dart';
import 'package:projects/themes/chappy_colors.dart';
import 'package:projects/themes/chappy_texts.dart';
import 'package:projects/widgets/chappy_avatar.dart';

enum MessagePosition { first, middle, last }

class MessageItem extends ContentItem {
  final Message message;
  final Profile profile;
  final bool isProfile;
  final bool isSolo;
  final MessagePosition position;

  MessageItem({
    required this.message,
    required this.profile,
    this.isProfile = false,
    this.isSolo = false,
    required this.position,
  });

  @override
  String get createdBy => message.createdBy;

  @override
  DateTime get createdAt => message.createdAt;

  @override
  int get order => 1;

  @override
  bool get isMessage => true;

  Radius topRight = const Radius.circular(0);
  Radius topLeft = const Radius.circular(0);
  Radius bottomLeft = const Radius.circular(0);
  Radius bottomRight = const Radius.circular(0);

  @override
  Widget build(BuildContext context) {
    if (isProfile) {
      topLeft = const Radius.circular(12);
      bottomLeft = const Radius.circular(12);
      if (position == MessagePosition.last) {
        bottomRight = const Radius.circular(12);
      }
    } else {
      topRight = const Radius.circular(12);
      bottomRight = const Radius.circular(12);
      if (position == MessagePosition.last) {
        bottomLeft = const Radius.circular(12);
      }
    }

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isProfile)
              Container(
                width: 24,
                height: 24,
                margin: const EdgeInsets.only(right: 4),
                child: position == MessagePosition.first || isSolo
                    ? ChappyAvatar(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(profile: profile),
                          ),
                        ),
                        image: profile.picture,
                      )
                    : Container(),
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: isProfile
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (isProfile) ...[
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              message.createdAt.hourAndMinute,
                              style: const TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 4,
                          height: 4,
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          decoration: const BoxDecoration(
                            color: ChappyColors.grey,
                          ),
                        ),
                      ],
                      Align(
                        alignment: isProfile
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                            padding: const EdgeInsets.all(12),
                            constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.75,
                            ),
                            decoration: BoxDecoration(
                                color: isProfile
                                    ? ChappyColors.primaryColor
                                    : ChappyColors.grey100,
                                borderRadius: BorderRadius.only(
                                  topLeft: topLeft,
                                  topRight: topRight,
                                  bottomLeft: bottomLeft,
                                  bottomRight: bottomRight,
                                )),
                            child: Column(
                              crossAxisAlignment: isProfile
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                              children: [
                                Text(
                                  message.content,
                                  style: ChappyTexts.body2.apply(
                                      color: isProfile
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ],
                            )),
                      ),
                      if (!isProfile) ...[
                        Container(
                          width: 4,
                          height: 4,
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          decoration: const BoxDecoration(
                            color: ChappyColors.grey,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              message.createdAt.hourAndMinute,
                              style: ChappyTexts.caption.apply(
                                color: ChappyColors.grey900,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 1),
                  if (position == MessagePosition.last || isSolo)
                    const SizedBox(height: 14),
                ],
              ),
            ),
          ],
        ));
  }
}
