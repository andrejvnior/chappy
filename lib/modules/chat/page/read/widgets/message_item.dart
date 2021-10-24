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
  int get order => 0;

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

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        margin: EdgeInsets.only(
            bottom: position == MessagePosition.first ||
                    position == MessagePosition.middle
                ? 2
                : 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment:
              isProfile ? MainAxisAlignment.end : MainAxisAlignment.start,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (position == MessagePosition.first)
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      profile.nickname,
                      style: ChappyTexts.caption
                          .apply(color: ChappyColors.primaryColor),
                    ),
                  ),
                Align(
                  alignment:
                      isProfile ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.85,
                    ),
                    decoration: BoxDecoration(
                        color: isProfile
                            ? ChappyColors.primaryColor
                            : ChappyColors.grey900,
                        borderRadius: BorderRadius.only(
                          topLeft: topLeft,
                          topRight: topRight,
                          bottomLeft: bottomLeft,
                          bottomRight: bottomRight,
                        )),
                    child: RichText(
                      text: TextSpan(
                          text: message.createdAt.abbrDate,
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                            letterSpacing: 0.25,
                            color: ChappyColors.primaryColor,
                          ),
                          children: [
                            const WidgetSpan(
                              child: SizedBox(
                                width: 4,
                              ),
                            ),
                            TextSpan(
                              text: position.toString() +
                                  " " +
                                  isSolo.toString() +
                                  " " +
                                  createdBy,
                              style: ChappyTexts.body2.apply(
                                color: isProfile ? Colors.white : Colors.black,
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
