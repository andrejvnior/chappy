import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projects/modules/chat/models/chat.dart';
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

  Future<Chat> getChat(String uuid) async {
    final chat = await chats.where('uuid', isEqualTo: uuid).get();

    return Chat.fromMap(chat.docs.first.data());
  }


  Stream<List<Chat>> getChats() {
    print('Getting chats...');
    return chats.snapshots().map((query) =>
        query.docs.map((doc) => Chat.fromMap(doc.data())).toList());
  }

  Future<void> sendMessage(Message message, String uuid) {
    print('Sending message: ${message.content}...');

    final messages = chats.doc(uuid).collection('messages');
    return messages
        .doc(message.uuid)
        .set(message.toMap())
        .then((value) => print('Message succesfully sent.'))
        .catchError((error) => print('Error senting message.'));
  }

  Stream<List<Message>> getMessages(String uuid) {
    print('Getting messages of $uuid...');

    final messages = chats.doc(uuid).collection('messages');
    return messages.snapshots().map((query) =>
        query.docs.map((doc) => Message.fromMap(doc.data())).toList());
  }
}
