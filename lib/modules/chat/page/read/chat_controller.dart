import 'package:mobx/mobx.dart';
import 'package:projects/modules/chat/models/chat.dart';
import 'package:projects/modules/chat/models/member.dart';
import 'package:projects/modules/chat/models/message.dart';
import 'package:projects/modules/chat/repositories/chat_repository.dart';
import 'package:projects/modules/profile/models/profile.dart';
import 'package:projects/modules/profile/repositories/profile_repository.dart';
import 'package:uuid/uuid.dart';

part 'chat_controller.g.dart';

class ChatController = ChatControllerBase with _$ChatController;

abstract class ChatControllerBase with Store {
  ChatControllerBase(this.chat, this.profile) {
    print('Chat in controller: ${chat?.title}');
    if (chat != null) {
      observableStreamMessage =
          chatRepository.getMessages(chat!).asObservable();
      print('Initiate members...');
      observableStreamMember = chatRepository.getMembers(chat!).asObservable();
    }
    observableStreamProfile = profileRepository.getProfiles().asObservable();
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
  ProfileRepository profileRepository = ProfileRepository();

  ObservableStream<List<Message>>? observableStreamMessage;
  ObservableStream<List<Member>>? observableStreamMember;

  ObservableFuture<List<Profile>>? observableStreamProfile;

  @computed
  List<Profile> get profileList {
    print('Profile in Controller...');
    if (observableStreamProfile == null) return <Profile>[];
    List<Profile> list =
        observableStreamProfile?.value?.toList() ?? <Profile>[];

    print('Profile list sucessfully built: ${list.length}');

    List<Profile> profiles = <Profile>[];
    if (memberList.isNotEmpty) {
      for (final member in memberList) {
        print('Members in profile list: ${member.id}');
        print(
            'Profile in loop: ${list.where((element) => element.uuid == member.id).first.name}');
        if (member.online) {
          final profile =
              list.where((element) => element.uuid == member.id).first;

          profiles.add(profile);
        }
      }
    }

    return profiles;
  }

  @computed
  List<Message> get messageList {
    print('Message in Controller...');
    if (observableStreamMessage == null) return <Message>[];
    final list = observableStreamMessage?.value?.toList() ?? <Message>[];

    print('Message list sucessfully built: ${list.length}');

    list.sort((b, a) => a.createdAt.compareTo(b.createdAt));

    return list;
  }

  @action
  Future<void> sendMessage() async {
    message = Message(
      content: text,
      createdBy: profile?.uuid ?? '',
    );
    await chatRepository
        .sendMessage(message, chat!)
        .then((value) => print('Message sent.'))
        .whenComplete(() => setText(''));
  }

  @computed
  List<Member> get memberList {
    print('Member in Controller...');
    if (observableStreamMember == null) return <Member>[];
    List<Member> list = observableStreamMember?.value?.toList() ?? <Member>[];

    print('Members list sucessfully built: ${list.length}');

    list = list.where((member) => member.online).toList();

    return list;
  }

  @action
  Future<void> logoutMember() async {
    print('Logging out profile... ${profile?.uuid}');
    print('Logging out from chat... ${chat?.uuid}');
    Member member =
        memberList.where((m) => m.id == profile?.uuid && m.online).first;

    await chatRepository
        .logoutMember(member, chat!)
        .then((value) => print('Message sent.'))
        .whenComplete(() => setText(''));
  }
}
