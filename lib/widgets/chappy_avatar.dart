import 'package:flutter/material.dart';

class ChappyAvatar extends StatelessWidget {
  final bool large;
  final String? image;
  final VoidCallback? onPressed;

  const ChappyAvatar({Key? key, this.large = false, this.image, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: large ? 100 : 36,
        height: large ? 100 : 36,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              image ?? 'images/profile.jpg',
            ),
          ),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
