import 'package:flutter/material.dart';
import 'package:projects/themes/chappy_colors.dart';
import 'package:projects/themes/chappy_texts.dart';

class ChappyButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;

  const ChappyButton({Key? key, this.onPressed, this.title = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: ChappyColors.primaryColor,
          primary: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(48),
              bottomLeft: Radius.circular(48),
              bottomRight: Radius.circular(48),
            ),
          ),
        ),
        child: Text(
          title.toUpperCase(),
          style: ChappyTexts.button1,
        ),
      ),
    );
  }
}
