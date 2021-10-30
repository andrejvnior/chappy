import 'package:flutter/material.dart';
import 'package:projects/themes/chappy_colors.dart';
import 'package:projects/themes/chappy_icons.dart';
import 'package:projects/widgets/chappy_icon.dart';

class ChappyIconCounter extends StatelessWidget {
  final String? icon;
  final int value;

  const ChappyIconCounter({Key? key, this.icon, this.value = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ChappyIcon(
          onPressed: () {},
          icon:  icon ?? ChappyIcons.mention,
          color: ChappyColors.grey900,
        ),
        Positioned(
          top: 4,
          right: 4,
          child: Container(
            alignment: Alignment.center,
            width: 13,
            height: 13,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(10)),
            child: Text(
              value.toString(),
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                fontSize: 8,
                letterSpacing: 0.15,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
