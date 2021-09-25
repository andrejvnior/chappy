import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:projects/modules/chat/models/chat.dart';
import 'package:projects/modules/chat/repositories/chat_repository.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  HomeControllerBase(){
    observableStream = chatRepository.getChats().asObservable();
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  ChatRepository chatRepository = ChatRepository();

  ObservableStream<List<Chat>>? observableStream;

  @computed
  List<Chat> get chatList {
    print('Chat name in Controller...');
    final list = observableStream?.value?.toList() ?? <Chat>[];

    return list;
  }

  @action
  Future<void> logout() async {
    await auth.signOut();
  }
}
