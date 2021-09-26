import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projects/modules/chat/models/chat.dart';
import 'package:projects/modules/chat/models/member.dart';
import 'package:projects/modules/chat/models/message.dart';

class ChatRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final chats = FirebaseFirestore.instance.collection('chats');

  Future<bool> createChat(Chat chat) {
    print('Creating chat with title ${chat.title}...');

    return chats
        .doc(chat.uuid)
        .set(chat.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<Chat> getChat(Chat chat) async {
    final c = await chats.where('uuid', isEqualTo: chat.uuid).get();

    return Chat.fromMap(c.docs.first.data());
  }

  Stream<List<Chat>> getChats() {
    print('Getting chats...');
    return chats.snapshots().map(
        (query) => query.docs.map((doc) => Chat.fromMap(doc.data())).toList());
  }

  Future<void> sendMessage(Message message, Chat chat) {
    print('Sending message: ${message.content}...');

    final messages = chats.doc(chat.uuid).collection('messages');
    return messages
        .doc(message.uuid)
        .set(message.toMap())
        .then((value) => print('Message succesfully sent.'))
        .catchError((error) => print('Error senting message.'));
  }

  Stream<List<Message>> getMessages(Chat chat) {
    print('Getting messages of ${chat.uuid}uuid...');

    final messages = chats.doc(chat.uuid).collection('messages');
    return messages.snapshots().map((query) =>
        query.docs.map((doc) => Message.fromMap(doc.data())).toList());
  }

  Future<void> createMember(Member member, String uuid) {
    print('Creating member with id ${member.id}...');
    print('Creating ddsdsd with id ${uuid}...');

    final members = chats.doc(uuid).collection('members');
    return members
        .doc(member.uuid)
        .set(member.toMap())
        .then((value) => print('Member succesfully created.'))
        .catchError((error) => print('Error creating member.'));
  }

  Future<void> logoutMember(Member member,Chat chat) {
    print('Logging out in repository... ${member.uuid}');
    print('Logging out from chat in repository... ${chat.uuid}');
    final members = chats.doc(chat.uuid).collection('members');
    return members
        .doc(member.uuid)
        .update({
          'online': false,
          'logoutAt': DateTime.now(),
        })
        .then((value) => print("Member logged out"))
        .catchError((error) => print("Failed to logout member: $error"));
  }

  Stream<List<Member>> getMembers(Chat chat) {
    print('Getting members at ${chat.uuid}...');
    final members = chats.doc(chat.uuid).collection('members');
    return members.snapshots().map((query) =>
        query.docs.map((doc) => Member.fromMap(doc.data())).toList());
  }
}
