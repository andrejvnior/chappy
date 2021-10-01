import 'package:projects/models/firebase_model.dart';

class Follow {
  String uuid;
  DateTime? createdAt;

  Follow({required this.uuid,  this.createdAt}) {
    createdAt = DateTime.now();
  }

  Follow.fromMap(Map<String, dynamic> map)
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
