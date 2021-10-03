import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChappyCameraOptions extends StatelessWidget {
  final Function(ImageSource) onSelected;

  const ChappyCameraOptions({Key? key, required this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.image),
          title: const Text('Galeria'),
          onTap: () {
            onSelected(ImageSource.gallery);
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.camera_alt),
          title: const Text('Camera'),
          onTap: () {
            onSelected(ImageSource.camera);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
