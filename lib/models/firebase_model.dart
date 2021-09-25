class FirebaseModel {
  String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  int appVersion;

  FirebaseModel(this.uuid, this.createdAt, this.updatedAt, this.appVersion);

  FirebaseModel.fromMap(Map<String, dynamic> map)
      : uuid = map['uuid'] as String,
        createdAt = DateTime.fromMillisecondsSinceEpoch(
            map['createdAt'].millisecondsSinceEpoch),
        updatedAt = DateTime.fromMillisecondsSinceEpoch(
            map['updatedAt'].millisecondsSinceEpoch),
        appVersion = map['appVersion'] as int;

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'appVersion': appVersion,
    };
  }
}
