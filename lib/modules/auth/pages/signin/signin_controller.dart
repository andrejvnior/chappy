import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projects/models/firebase_model.dart';
import 'package:projects/modules/profile/models/profile.dart';
import 'package:projects/modules/profile/repositories/profile_repository.dart';

part 'signin_controller.g.dart';

class SignInController = SignInControllerBase with _$SignInController;

abstract class SignInControllerBase with Store {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  ProfileRepository profileRepository = ProfileRepository();

  Profile? profile;

  @observable
  String errorMessage = '';

  @action
  setErrorMessage() => errorMessage = 'Please, insert mandatory fields.';

  @observable
  bool isLoading = false;

  @observable
  String email = '';
  @observable
  String password = '';

  @action
  void setEmail(String v) => email = v;

  @action
  void setPassword(String v) => password = v;

  Future<SaveResult> signIn() async {
    isLoading = true;
    try {
      UserCredential userCredential = await auth
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        await getProfile();
        return SaveResult.success;
      }
      return SaveResult.failed;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      }
    }
    return SaveResult.failed;
  }

  @action
  Future<void> getProfile() async {
    profile = await profileRepository.getProfile(auth.currentUser?.email ?? '');
  }

  @computed
  bool get isValid => email.isNotEmpty && password.isNotEmpty;
}
