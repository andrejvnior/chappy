import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:projects/modules/chat/models/chat.dart';
import 'package:projects/modules/chat/repositories/chat_repository.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  HomeControllerBase(){
    getChats();
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  ChatRepository chatRepository = ChatRepository();

  ObservableList<Chat> chatList = ObservableList<Chat>();

  @action
  Future<void> getChats() async {
    print('Chat name in Controller...');
    final list = await chatRepository.getChats().then((value) => value);

    chatList = list.asObservable();
  }

  @action
  Future<void> logout() async {
    await auth.signOut();
  }
}
