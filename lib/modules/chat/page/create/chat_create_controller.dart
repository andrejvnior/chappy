import 'package:mobx/mobx.dart';
import 'package:projects/models/firebase_model.dart';
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

  @action
  void setTitle(String v) => title = v;

  @action
  void setDescription(String v) => description = v;

  @action
  void setCategory(int v) => category = v;

  @action
  Future<SaveResult> createChat() async {
    isLoading = true;

    chat = Chat(
      title: title,
      description: description,
      category: category,
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
    final result = await chatRepository.enter(member, chat.uuid);
    return result;
  }

  @computed
  bool get isValid => title.isNotEmpty && description.isNotEmpty;
}
