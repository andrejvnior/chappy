import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projects/models/firebase_model.dart';
import 'package:projects/modules/profile/models/profile.dart';

class ProfileRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final users = FirebaseFirestore.instance.collection('users');

  Future<SaveResult> createProfile(Profile profile) {
    return users
        .doc(profile.uuid)
        .set(profile.toMap())
        .then((value) => SaveResult.success)
        .catchError((error) => SaveResult.failed);
  }

  Future<Profile?> getProfile(String email) async {
    print('Getting profile,,, repo $email');
    final userProfile = await users.where('email', isEqualTo: email).get();

    if (userProfile.docs.isEmpty) return null;

    print('Getting profile,,, splash');
    return Profile.fromMap(userProfile.docs.first.data());
  }

  Future<List<Profile>> getProfiles() async {
    final userProfile = await users.get();

    return userProfile.docs.map((e) => Profile.fromMap(e.data())).toList();
  }
}
