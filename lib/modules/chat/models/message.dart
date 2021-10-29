import 'package:projects/models/firebase_model.dart';

class Message extends FirebaseModel {
  final String content;
  final String createdBy;
  final List<dynamic> recipients;
  final bool isPrivate;

  Message({
    this.content = '',
    this.createdBy = '',
    this.recipients = const <dynamic>[],
    this.isPrivate = false,
    String uuid = '',
    DateTime? createdAt,
  }) : super(uuid, createdAt = createdAt ?? DateTime.now());

  Message.fromMap(Map<String, dynamic> map)
      : content = map['message'] as String,
        createdBy = map['createdBy'] as String,
        recipients = map['recipients'] as List<dynamic>,
        isPrivate = map['isPrivate'] as bool,
        super.fromMap(map);

  @override
  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'message': content,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'recipients': recipients,
      'isPrivate': isPrivate,
    };
  }
}
