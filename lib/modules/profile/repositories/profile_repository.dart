import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projects/modules/profile/models/profile.dart';

class ProfileRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final users = FirebaseFirestore.instance.collection('users');

  Future<bool> createProfile(Profile profile) {
    print('Creating profile for ${profile.name}...');

    return users
        .doc(profile.uuid)
        .set(profile.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<Profile> getProfile(String email) async {
    final userProfile = await users.where('email', isEqualTo: email).get();

    return Profile.fromMap(userProfile.docs.first.data());
  }

  Future<List<Profile>> getProfiles() async {
    final userProfile = await users.get();

    return userProfile.docs.map((e) => Profile.fromMap(e.data())).toList();
  }
}
