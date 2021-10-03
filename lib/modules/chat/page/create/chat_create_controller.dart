import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:projects/models/firebase_model.dart';
import 'package:projects/modules/camera/models/camera.dart';
import 'package:projects/modules/chat/models/chat.dart';
import 'package:projects/modules/chat/models/member.dart';
import 'package:projects/modules/chat/repositories/chat_repository.dart';
import 'package:projects/modules/profile/models/profile.dart';

part 'chat_create_controller.g.dart';

class ChatCreateController = ChatCreateControllerBase
    with _$ChatCreateController;

abstract class ChatCreateControllerBase with Store {
  ChatCreateControllerBase(this.profile);

  ChatRepository chatRepository = ChatRepository();

  Camera camera = Camera();

  Chat chat = Chat();
  Profile? profile;
  Member member = Member();

  @observable
  String errorMessage = '';

  @action
  setErrorMessage() => errorMessage = 'Please, insert mandatory fields.';

  @observable
  bool isLoading = false;

  @observable
  String title = '';

  @observable
  String description = '';

  @observable
  int category = 0;

  @observable
  String picture = '';

  @action
  void setTitle(String v) => title = v;

  @action
  void setDescription(String v) => description = v;

  @action
  void setCategory(int v) => category = v;

  @observable
  File? imageFile;

  @action
  Future<void> takePicture(ImageSource imageSource) async {
    imageFile = await camera.pickImage(imageSource);
  }

  @action
  Future<SaveResult> createChat() async {
    isLoading = true;

    if (imageFile != null) {
      picture = await camera.upload(imageFile!);
    }

    chat = Chat(
      title: title,
      description: description,
      category: category,
      picture: picture,
    );

    SaveResult result = await chatRepository.createChat(chat);

    result = await enter();

    isLoading = false;

    return result;
  }

  @action
  Future<SaveResult> enter() async {
    member = Member(
      id: profile?.uuid,
      online: true,
      logoutAt: DateTime.now(),
    );
    final result = await chatRepository.enter(member, chat);
    return result;
  }

  @computed
  bool get isValid => title.isNotEmpty && description.isNotEmpty;
}
