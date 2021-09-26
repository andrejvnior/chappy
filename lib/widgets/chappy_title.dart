import 'package:flutter/material.dart';

class ChappyTitle extends StatelessWidget {
  final String title;

  const ChappyTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
