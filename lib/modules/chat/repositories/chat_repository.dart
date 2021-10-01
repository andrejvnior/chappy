import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projects/models/firebase_model.dart';
import 'package:projects/modules/chat/models/chat.dart';
import 'package:projects/modules/chat/models/member.dart';
import 'package:projects/modules/chat/models/message.dart';

class ChatRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final collection = FirebaseFirestore.instance.collection('chats');

  Future<SaveResult> createChat(Chat chat) {
    return collection
        .doc(chat.uuid)
        .set(chat.toMap())
        .then((value) => SaveResult.success)
        .catchError((error) => SaveResult.failed);
  }

  Future<Chat> getChat(Chat chat) async {
    final c = await collection.where('uuid', isEqualTo: chat.uuid).get();

    return Chat.fromMap(c.docs.first.data());
  }

  Stream<List<Chat>> chats() {
    return collection.snapshots().map(
        (query) => query.docs.map((doc) => Chat.fromMap(doc.data())).toList());
  }

  Future<SaveResult> sendMessage(Message message, Chat chat) {
    final messages = collection.doc(chat.uuid).collection('messages');
    return messages
        .doc(message.uuid)
        .set(message.toMap())
        .then((value) => SaveResult.success)
        .catchError((error) => SaveResult.failed);
  }

  Stream<List<Message>> messages(Chat chat) {
    final messages = collection.doc(chat.uuid).collection('messages');

    return messages.snapshots().map((query) =>
        query.docs.map((doc) => Message.fromMap(doc.data())).toList());
  }

  Future<SaveResult> enter(Member member, Chat chat) {
    final members = collection.doc(chat.uuid).collection('members');

    return members
        .doc(member.uuid)
        .set(member.toMap())
        .then((value) => SaveResult.success)
        .catchError((error) => SaveResult.failed);
  }

  Future<SaveResult> exit(Member member, Chat chat) {
    final members = collection.doc(chat.uuid).collection('members');
    return members
        .doc(member.uuid)
        .update({
          'online': false,
          'logoutAt': DateTime.now(),
        })
        .then((value) => SaveResult.success)
        .catchError((error) => SaveResult.failed);
  }

  Stream<List<Member>> members(Chat chat) {
    final members = collection.doc(chat.uuid).collection('members');
    return members.snapshots().map((query) =>
        query.docs.map((doc) => Member.fromMap(doc.data())).toList());
  }
}
