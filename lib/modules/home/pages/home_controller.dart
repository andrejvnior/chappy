import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:projects/modules/chat/models/chat.dart';
import 'package:projects/modules/chat/models/member.dart';
import 'package:projects/modules/chat/repositories/chat_repository.dart';
import 'package:projects/modules/profile/models/profile.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  HomeControllerBase(this.profile) {
    observableStream = chatRepository.chats().asObservable();
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  ChatRepository chatRepository = ChatRepository();

  ObservableStream<List<Chat>>? observableStream;

  Profile? profile;
  Chat chat = Chat();
  Member member = Member();

  @computed
  List<Chat> get chats {
    List<Chat> list = observableStream?.value?.toList() ?? <Chat>[];

    if (category != 0) {
      list = list.where((chat) => chat.category == category).toList();
    }

    return list;
  }

  @action
  Future<void> createMember(Chat chat) async {
    this.chat = chat;
    member = Member(
      id: profile?.uuid,
      online: true,
      logoutAt: DateTime.now(),
    );
    await chatRepository.enter(member, chat.uuid);
  }

  @action
  Future<void> logout() async {
    await auth.signOut();
  }

  @observable
  int category = 0;

  @action
  void setCategory(int v) => category = v;
}
