import 'package:flutter/material.dart';
import 'package:projects/themes/chappy_colors.dart';

class ChappyButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;

  const ChappyButton({Key? key, this.onPressed, this.title = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: ChappyColors.primaryColor,
            primary: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16)),
        child: Text(title),
      ),
    );
  }
}
