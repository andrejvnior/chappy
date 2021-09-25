import 'package:flutter/material.dart';

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
      this.obscureText = false, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        prefix: prefix,
      ),
    );
  }
}
