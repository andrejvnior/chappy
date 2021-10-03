import 'package:flutter/material.dart';
import 'package:projects/themes/chappy_colors.dart';

class ChappySquaredCheckbox extends StatefulWidget {
  final bool isSelected;
  final VoidCallback? onPressed;

  const ChappySquaredCheckbox(
      {Key? key, required this.isSelected, this.onPressed})
      : super(key: key);

  @override
  _ChappySquaredCheckboxState createState() => _ChappySquaredCheckboxState();
}

class _ChappySquaredCheckboxState extends State<ChappySquaredCheckbox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: widget.isSelected
              ? ChappyColors.primaryColor
              : ChappyColors.grey100,
          border: Border.all(color: ChappyColors.grey300, width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
