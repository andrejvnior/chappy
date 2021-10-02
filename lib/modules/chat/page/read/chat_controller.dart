import 'package:mobx/mobx.dart';
import 'package:projects/modules/chat/models/chat.dart';
import 'package:projects/modules/chat/models/member.dart';
import 'package:projects/modules/chat/models/message.dart';
import 'package:projects/modules/chat/repositories/chat_repository.dart';
import 'package:projects/modules/profile/models/profile.dart';
import 'package:projects/modules/profile/repositories/profile_repository.dart';

part 'chat_controller.g.dart';

class ChatController = ChatControllerBase with _$ChatController;

abstract class ChatControllerBase with Store {
  ChatControllerBase(this.chat, this.profile) {
    if (chat != null) {
      observableStreamMessage = chatRepository.messages(chat!).asObservable();
      observableStreamMember = chatRepository.members(chat!).asObservable();
    }
    observableFutureProfile = profileRepository.getProfiles().asObservable();
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

  ObservableFuture<List<Profile>>? observableFutureProfile;

  @computed
  List<Profile> get profiles {
    if (observableFutureProfile == null) return <Profile>[];

    final list = observableFutureProfile?.value?.toList() ?? <Profile>[];

    List<Profile> profiles = <Profile>[];
    if (members.isNotEmpty) {
      for (final member in members) {
        if (member.online) {
          final profile =
              list.where((element) => element.uuid == member.id).first;

          profiles.add(profile);
        }
      }
    }

    if (private && search.isNotEmpty) {
      final replaced = search.replaceFirst(RegExp('@'), '');
      profiles =
          profiles.where((profile) => profile.name.contains(replaced)).toList();
    }

    return profiles;
  }

  @computed
  List<Message> get messages {
    if (observableStreamMessage == null) return <Message>[];

    final list = observableStreamMessage?.value?.toList() ?? <Message>[];

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
        .whenComplete(() => setText(''));
  }

  @computed
  List<Member> get members {
    if (observableStreamMember == null) return <Member>[];

    List<Member> list = observableStreamMember?.value?.toList() ?? <Member>[];

    list = list.where((member) => member.online).toList();

    return list;
  }

  @action
  Future<void> exit() async {
    Member member =
        members.where((m) => m.id == profile?.uuid && m.online).first;

    await chatRepository.exit(member, chat!).whenComplete(() => setText(''));
  }

  @computed
  bool get private {
    return text.isNotEmpty && text[0] == '@';
  }

  @observable
  String search = '';

  @action
  void setSearch(String v) {
    search = v;

    if (search.isEmpty) {
      text = '';
    }
  }
}
