import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:projects/modules/camera/repositories/camera_repository.dart';

part 'camera.g.dart';

class Camera = CameraBase with _$Camera;

// TODO: STUDY THIS SOLUTION
abstract class CameraBase with Store {
  final picker = ImagePicker();

  final cameraRepository = CameraRepository();

  Future<File> pickImage(ImageSource imageSource) async {
    final pickedFile = await picker.pickImage(source: imageSource);

    final imageFile = File(pickedFile!.path);

    return imageFile;
  }

  Future<String> upload(File file) async {
    final result = await cameraRepository.upload(file);
    return result;
  }
}