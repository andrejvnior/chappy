class Profile {
  String? uuid;
  String email;
  String name;
  String nickname;
  String bio;
  String gender;
  DateTime? age;
  DateTime? createdAt;

  Profile(
      {this.uuid,
      this.email = '',
      this.name = '',
      this.nickname = '',
      this.bio = '',
      this.gender = '',
      this.age,
      this.createdAt});

  Profile.fromMap(Map<String, dynamic> map)
      : uuid = map['uuid'] as String,
        email = map['email'] as String,
        name = map['name'] as String,
        nickname = map['nickname'] as String,
        bio = map['bio'] as String,
        gender = map['gender'] as String,
        age = DateTime.fromMillisecondsSinceEpoch(
            map['age'].millisecondsSinceEpoch),
        createdAt = DateTime.fromMillisecondsSinceEpoch(
            map['createdAt'].millisecondsSinceEpoch);

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
