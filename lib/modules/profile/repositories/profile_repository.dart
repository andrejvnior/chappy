import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projects/models/firebase_model.dart';
import 'package:projects/modules/profile/models/follow.dart';
import 'package:projects/modules/profile/models/profile.dart';

class ProfileRepository {
  final collection = FirebaseFirestore.instance.collection('users');

  Future<SaveResult> createProfile(Profile profile) {
    return collection
        .doc(profile.uuid)
        .set(profile.toMap())
        .then((value) => SaveResult.success)
        .catchError((error) => SaveResult.failed);
  }

  Future<SaveResult> updateProfile(Profile profile) {
    return collection
        .doc(profile.uuid)
        .update(profile.toMap())
        .then((value) => SaveResult.success)
        .catchError((error) {
      return SaveResult.failed;
    });
  }

  Future<Profile?> getProfile(String email) async {
    final userProfile = await collection.where('email', isEqualTo: email).get();

    if (userProfile.docs.isEmpty) return null;

    return Profile.fromMap(userProfile.docs.first.data());
  }

  Future<List<Profile>> getProfiles() async {
    final userProfile = await collection.get();

    return userProfile.docs.map((e) => Profile.fromMap(e.data())).toList();
  }

  Stream<List<Follow>> followers(Profile profile) {
    final followersCollection =
        collection.doc(profile.uuid).collection('followers');

    return followersCollection.snapshots().map((query) =>
        query.docs.map((doc) => Follow.fromMap(doc.data())).toList());
  }

  Stream<List<Follow>> following(Profile profile) {
    final followingCollection =
        collection.doc(profile.uuid).collection('following');

    return followingCollection.snapshots().map((query) =>
        query.docs.map((doc) => Follow.fromMap(doc.data())).toList());
  }

  Future<SaveResult> follow(Follow following, Follow follower) async {
    final followingCollection =
        collection.doc(follower.uuid).collection('following');
    final followersCollection =
        collection.doc(following.uuid).collection('followers');

    SaveResult result = await followingCollection
        .doc(following.uuid)
        .set(following.toMap())
        .then((value) => SaveResult.success)
        .catchError((error) => SaveResult.failed);

    if (result == SaveResult.success) {
      result = await followersCollection
          .doc(follower.uuid)
          .set(follower.toMap())
          .then((value) => SaveResult.success)
          .catchError((error) => SaveResult.failed);
    }

    if (result == SaveResult.failed) {
      await followingCollection.doc(following.uuid).delete();
      await followingCollection.doc(follower.uuid).delete();
      return result;
    }

    return result;
  }

  Future<SaveResult> unfollow(Follow following, Follow follower) async {
    final followingCollection =
        collection.doc(follower.uuid).collection('following');
    final followersCollection =
        collection.doc(following.uuid).collection('followers');

    SaveResult result = await followingCollection
        .doc(following.uuid)
        .delete()
        .then((value) => SaveResult.success)
        .catchError((error) => SaveResult.failed);

    if (result == SaveResult.success) {
      result = await followersCollection
          .doc(follower.uuid)
          .delete()
          .then((value) => SaveResult.success)
          .catchError((error) => SaveResult.failed);
    }

    return result;
  }

  Future<bool> verifyNickname(String nickname) async {
    final nicknameExists =
        await collection.where('nickname', isEqualTo: nickname).get();

    if (nicknameExists.docs.isEmpty) {
      return true;
    }
    return false;
  }
}
