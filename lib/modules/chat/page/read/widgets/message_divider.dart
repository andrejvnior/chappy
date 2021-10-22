import 'package:flutter/material.dart';
import 'package:projects/modules/profile/models/profile.dart';

class MessageDivider extends StatelessWidget {
  final Profile profile;
  final bool isProfile;

  const MessageDivider({Key? key, required this.profile, this.isProfile = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      height: 16,
      margin: EdgeInsets.only(top: isProfile ? 0 : 8, bottom: 4),
      child: isProfile ? Container() : Text('@${profile.nickname}'),
    );
  }
}
