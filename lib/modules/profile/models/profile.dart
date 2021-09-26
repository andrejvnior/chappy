import 'package:projects/models/firebase_model.dart';

class Profile extends FirebaseModel {
  String email;
  String name;
  String nickname;
  String bio;
  String gender;
  DateTime? age;

  Profile({
    this.email = '',
    this.name = '',
    this.nickname = '',
    this.bio = '',
    this.gender = '',
    this.age,
    String uuid = '',
    DateTime? createdAt,
  }) : super(
          uuid,
          createdAt = createdAt ?? DateTime.now(),
        );

  Profile.fromMap(Map<String, dynamic> map)
      : email = map['email'] as String,
        name = map['name'] as String,
        nickname = map['nickname'] as String,
        bio = map['bio'] as String,
        gender = map['gender'] as String,
        age = DateTime.fromMillisecondsSinceEpoch(
            map['age'].millisecondsSinceEpoch),
        super.fromMap(map);

  @override
  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'email': email,
      'name': name,
      'nickname': nickname,
      'bio': bio,
      'gender': gender,
      'age': age,
      'createdAt': createdAt,
    };
  }
}
