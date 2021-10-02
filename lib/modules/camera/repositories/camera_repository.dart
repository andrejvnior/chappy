import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

// TODO: STUDY THIS SOLUTION
class CameraRepository {
  final storage = FirebaseStorage.instance.ref();

  Future<String> upload(File file) async {
    final fileName = file.path;
    final reference = storage.child('uploads/$fileName');

    try {
      final result = await reference
          .putFile(file)
          .then((value) => value.ref.getDownloadURL())
          .catchError((error) => error);
      return result;
    } on FirebaseException catch (e) {
      return e.code;
    }
  }
}
