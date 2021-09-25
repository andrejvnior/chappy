import 'package:projects/models/firebase_model.dart';

class Chat extends FirebaseModel {
  final String title;
  final String description;

  Chat({
    this.title = '',
    this.description = '',
    String uuid = '',
    DateTime? createdAt,
    DateTime? updatedAt,
    int appVersion = 0,
  }) : super(uuid, createdAt = createdAt ?? DateTime.now(),
            updatedAt = updatedAt ?? DateTime.now(), appVersion);

  Chat.fromMap(Map<String, dynamic> map)
      : title = map['title'] as String,
        description = map['description'] as String,
        super.fromMap(map);

  @override
  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'title': title,
      'description': description,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'appVersion': appVersion,
    };
  }
}
