import 'package:projects/models/firebase_model.dart';

class Profile extends FirebaseModel {
  String email;
  String name;
  String nickname;
  String bio;
  String gender;
  DateTime birthday;
  String city;
  String country;
  List<int> interests;

  Profile({
    required this.email,
    required this.name,
    required this.nickname,
    required this.bio,
    required this.gender,
    required this.birthday,
    required this.city,
    required this.country,
    required this.interests,
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
        birthday = DateTime.fromMillisecondsSinceEpoch(
            map['birthday'].millisecondsSinceEpoch),
        city = map['city'] as String,
        country = map['country'] as String,
        interests = map['interests'].cast<int>(),
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
      'birthday': birthday,
      'city': city,
      'country': country,
      'interests': interests,
      'createdAt': createdAt,
    };
  }
}
