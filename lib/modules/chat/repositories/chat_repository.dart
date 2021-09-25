import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projects/modules/chat/models/chat.dart';

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

  Future<List<Chat>> getChats() async {
    print('Getting chats in Repository...');
    final docs = await chats.get().then((value) => value.docs);

    print('Succesfully got chats in Repository. Lenght: ${docs.length}');
    List<Chat> list = [];

    for (final chat in docs) {
      final c = Chat.fromMap(chat.data());
      print('Chat name in Repository? ${c.title}');
      list.add(c);
    }

    return list;
  }
}
