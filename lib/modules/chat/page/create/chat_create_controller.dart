import 'package:mobx/mobx.dart';
import 'package:projects/modules/chat/models/chat.dart';
import 'package:projects/modules/chat/repositories/chat_repository.dart';
import 'package:uuid/uuid.dart';

part 'chat_create_controller.g.dart';

class ChatCreateController = ChatCreateControllerBase with _$ChatCreateController;

abstract class ChatCreateControllerBase with Store {
  ChatRepository chatRepository = ChatRepository();

  Chat chat = Chat();

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

  @action
  void setTitle(String v) => title = v;

  @action
  void setDescription(String v) => description = v;

  @action
  Future<bool> createChat() async {
    isLoading = true;

    chat = Chat(
      title: title,
      description: description,
      uuid: const Uuid().v1(),
      createdAt: DateTime.now(),
    );
    final chatCreated = await chatRepository.createChat(chat);

    isLoading = false;

    return chatCreated;
  }

  @computed
  bool get isValid => title.isNotEmpty && description.isNotEmpty;
}
