import 'package:flutter/material.dart';
import 'package:projects/widgets/chappy_avatar.dart';

class ChappyListTile extends StatelessWidget {
  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onPressed;

  const ChappyListTile(
      {Key? key,
      required this.title,
      this.leading,
      this.subtitle,
      this.trailing,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            leading ?? ChappyAvatar(),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title,
                  subtitle ?? Container(),
                ],
              ),
            ),
            const SizedBox(width: 8),
            trailing ?? Container(),
          ],
        ),
      ),
    );
  }
}
