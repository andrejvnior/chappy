import 'package:mobx/mobx.dart';
import 'package:projects/modules/chat/models/chat.dart';
import 'package:projects/modules/chat/models/member.dart';
import 'package:projects/modules/chat/repositories/chat_repository.dart';
import 'package:projects/modules/profile/models/profile.dart';
import 'package:uuid/uuid.dart';

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
  Future<bool> createChat() async {
    isLoading = true;

    chat = Chat(
      title: title,
      description: description,
      category: category,
    );

    final chatCreated = await chatRepository.createChat(chat);

    createMember();

    isLoading = false;

    return chatCreated;
  }

  @action
  Future<void> createMember() async {
    member = Member(
      id: profile?.uuid,
      online: true,
      logoutAt: DateTime.now(),
    );
    await chatRepository
        .createMember(member, chat.uuid)
        .then((value) => print('Member created.'));
  }

  @computed
  bool get isValid => title.isNotEmpty && description.isNotEmpty;
}
