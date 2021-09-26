import 'package:flutter/material.dart';
import 'package:projects/themes/chappy_colors.dart';

class ChappyTextInput extends StatelessWidget {
  final String? hintText;
  final Widget? prefix;
  final Function(String)? onChanged;
  final bool obscureText;
  final TextEditingController? controller;

  const ChappyTextInput(
      {Key? key,
      this.hintText,
      this.prefix,
      this.onChanged,
      this.obscureText = false,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: obscureText ? 1 : 4,
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        prefix: prefix,
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: ChappyColors.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade500, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
