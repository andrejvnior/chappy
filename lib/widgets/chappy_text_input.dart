import 'package:flutter/material.dart';

class ChappyTextInput extends StatelessWidget {
  final String? hintText;
  final Widget? prefix;
  final Function(String)? onChanged;
  final bool obscureText;

  const ChappyTextInput(
      {Key? key,
      this.hintText,
      this.prefix,
      this.onChanged,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        prefix: prefix,
      ),
    );
  }
}
