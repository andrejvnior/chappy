import 'package:projects/models/firebase_model.dart';

class Member extends FirebaseModel {
  final String? id;
  final bool online;
  final DateTime? logoutAt;

  Member({
    this.id,
    this.online = false,
    this.logoutAt,
    String uuid = '',
    DateTime? createdAt,
  }) : super(
          uuid,
          createdAt = createdAt ?? DateTime.now(),
        );

  Member.fromMap(Map<String, dynamic> map)
      : id = map['id'] as String,
        online = map['online'] as bool,
        logoutAt = DateTime.fromMillisecondsSinceEpoch(
            map['logoutAt'].millisecondsSinceEpoch),
        super.fromMap(map);

  @override
  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'id': id,
      'online': online,
      'logoutAt': logoutAt,
      'createdAt': createdAt,
    };
  }
}
