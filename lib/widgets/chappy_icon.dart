import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChappyIcon extends StatelessWidget {
  final String icon;
  final Color? color;
  final String? semanticsLabel;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;

  const ChappyIcon({
    Key? key,
    required this.icon,
    this.color,
    this.semanticsLabel,
    this.onPressed,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.all(onPressed != null ? 8 : 0),
        child: SvgPicture.asset(
          icon,
          width: width ?? 20,
          height: height ?? 20,
          fit: BoxFit.scaleDown,
          color: color,
          semanticsLabel: semanticsLabel,
        ),
      ),
    );
  }
}
