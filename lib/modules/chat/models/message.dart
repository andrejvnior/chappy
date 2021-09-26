import 'package:projects/models/firebase_model.dart';

class Message extends FirebaseModel {
  final String content;
  final String createdBy;

  Message({
    this.content = '',
    this.createdBy = '',
    String uuid = '',
    DateTime? createdAt,
  }) : super(uuid, createdAt = createdAt ?? DateTime.now());

  Message.fromMap(Map<String, dynamic> map)
      : content = map['message'] as String,
        createdBy = map['createdBy'] as String,
        super.fromMap(map);

  @override
  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'message': content,
      'createdBy': createdBy,
      'createdAt': createdAt,
    };
  }
}