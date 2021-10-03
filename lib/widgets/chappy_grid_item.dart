import 'package:flutter/material.dart';
import 'package:projects/themes/chappy_colors.dart';
import 'package:projects/themes/chappy_texts.dart';

class ChappyGridItem extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool isSelected;

  const ChappyGridItem(
      {Key? key, required this.title, this.onPressed, this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: ChappyColors.primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              if (isSelected)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: ChappyColors.primaryColor),
                    ),
                  ),
                ),
              Text(
                title,
                style: ChappyTexts.subtitle1.apply(color: Colors.white),
              ),
            ],
          )),
    );
  }
}
