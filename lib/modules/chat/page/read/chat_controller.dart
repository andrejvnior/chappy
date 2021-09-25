import 'package:mobx/mobx.dart';
import 'package:projects/modules/chat/models/chat.dart';
import 'package:projects/modules/chat/models/message.dart';
import 'package:projects/modules/chat/repositories/chat_repository.dart';
import 'package:projects/modules/profile/models/profile.dart';
import 'package:uuid/uuid.dart';

part 'chat_controller.g.dart';

class ChatController = ChatControllerBase with _$ChatController;

abstract class ChatControllerBase with Store {
  ChatControllerBase(this.chat, this.profile) {
    print('Chat in controller: ${chat?.title}');
    if(chat != null){
      observableStream = chatRepository.getMessages(chat!.uuid).asObservable();
    }
  }


  Chat? chat;
  Profile? profile;
  late Message message;

  @observable
  bool isLoading = false;

  @observable
  String text = '';

  @action
  void setText(String v) => text = v;

  ChatRepository chatRepository = ChatRepository();

  ObservableStream<List<Message>>? observableStream;

  @computed
  List<Message> get messageList {
    print('Message in Controller...');
    if(observableStream == null) return <Message>[];
    final list = observableStream?.value?.toList() ?? <Message>[];

    print('Message list sucessfully built: ${list.length}');

    return list;
  }

  @action
  Future<void> sendMessage() async {
    message = Message(
      content: text,
      createdBy: profile?.uuid ?? '',
      uuid: const Uuid().v1(),
      createdAt: DateTime.now(),
    );
    await chatRepository
        .sendMessage(message, chat!.uuid)
        .then((value) => print('Message sent.'));
  }
}
