import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projects/models/firebase_model.dart';

class InterestRepository {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<SaveResult> updateProfileInterest(String uuid, List<int> interests) {
    return users
        .doc(uuid)
        .update({'interests': interests})
        .then((value) => SaveResult.success)
        .catchError((error) => SaveResult.failed);
  }
}
