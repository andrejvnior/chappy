import 'package:flutter/material.dart';
import 'package:projects/themes/chappy_texts.dart';

class ChappyAppBar extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final TextAlign? titleAlign;
  final Widget? leading;
  final List<Widget>? actions;

  const ChappyAppBar(
      {Key? key,
      required this.title,
      this.titleAlign,
      this.titleStyle,
      this.leading,
      this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leading ?? Container(),
            Expanded(
              child: Text(
                title,
                style: titleStyle ?? ChappyTexts.headline6,
                textAlign: titleAlign ?? TextAlign.center,
              ),
            ),
            Row(
              children: actions ?? [],
            )
          ],
        ),
      ),
    );
  }
}
