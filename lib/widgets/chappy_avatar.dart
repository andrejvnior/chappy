import 'dart:io';

import 'package:flutter/material.dart';

class ChappyAvatar extends StatelessWidget {
  final bool large;
  final String? image;
  final VoidCallback? onPressed;
  final File? file;

  const ChappyAvatar(
      {Key? key, this.large = false, this.image, this.onPressed, this.file})
      : super(key: key);

  builtImage() {
    if (image != null && image!.isNotEmpty) {
      return NetworkImage(image!);
    } else if (file != null && file!.path.isNotEmpty) {
      return FileImage(file!);
    } else {
      return const AssetImage('images/profile.jpg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: large ? 100 : 36,
        height: large ? 100 : 36,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: builtImage(),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
