import 'package:uuid/uuid.dart';

enum SaveResult {
  success,
  failed,
}

class FirebaseModel {
  String uuid;
  DateTime createdAt;

  FirebaseModel(this.uuid, this.createdAt) {
    uuid = const Uuid().v1();
    createdAt = DateTime.now();
  }

  FirebaseModel.fromMap(Map<String, dynamic> map)
      : uuid = map['uuid'] as String,
        createdAt = DateTime.fromMillisecondsSinceEpoch(
            map['createdAt'].millisecondsSinceEpoch);

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'createdAt': createdAt,
    };
  }
}
