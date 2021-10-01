import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:projects/modules/chat/models/chat.dart';
import 'package:projects/modules/chat/models/member.dart';
import 'package:projects/modules/chat/repositories/chat_repository.dart';
import 'package:projects/modules/profile/models/profile.dart';
import 'package:projects/modules/profile/repositories/profile_repository.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  HomeControllerBase(this.profile) {
    observableStream = chatRepository.chats().asObservable();
    getProfile().whenComplete(() => buildInterests());
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  ChatRepository chatRepository = ChatRepository();
  ProfileRepository profileRepository = ProfileRepository();

  ObservableStream<List<Chat>>? observableStream;

  ObservableList<int> interests = ObservableList<int>();

  Profile? profile;
  Chat chat = Chat();
  Member member = Member();

  @computed
  List<Chat> get chats {
    List<Chat> list = observableStream?.value?.toList() ?? <Chat>[];

    if (interest != 0) {
      list = list.where((chat) => chat.category == interest).toList();
    }

    return list;
  }

  @action
  Future<void> getProfile() async {
    profile = await profileRepository.getProfile(profile!.email);
    print('Profile: ${profile?.interests}');
  }
  @action
  buildInterests() {
    interests.insert(0, 0);
    for (final interest in profile!.interests) {
      interests.add(interest);
    }
  }

  @action
  Future<void> createMember(Chat chat) async {
    this.chat = chat;
    member = Member(
      id: profile?.uuid,
      online: true,
      logoutAt: DateTime.now(),
    );
    await chatRepository.enter(member, chat);
  }

  @action
  Future<void> logout() async {
    await auth.signOut();
  }

  @observable
  int interest = 0;

  @action
  void setInterest(int v) => interest = v;
}
