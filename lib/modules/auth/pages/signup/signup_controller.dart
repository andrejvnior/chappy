import 'package:mobx/mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projects/modules/profile/repositories/profile_repository.dart';

import 'package:projects/modules/profile/models/profile.dart';

part 'signup_controller.g.dart';

class SignUpController = SignUpControllerBase with _$SignUpController;

abstract class SignUpControllerBase with Store {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  ProfileRepository profileRepository = ProfileRepository();

  Profile profile = Profile();

  @observable
  String errorMessage = '';

  @action
  setErrorMessage() => errorMessage = 'Please, insert mandatory fields.';

  @observable
  bool isLoading = false;

  @action
  void setLoading() => isLoading = !isLoading;

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String name = '';

  @observable
  String nickname = '';

  @observable
  String bio = '';

  @observable
  String gender = '';

  // TODO: Implement age choice
  @observable
  DateTime age = DateTime.now().subtract(const Duration(days: 8665));

  @action
  void setEmail(String v) => email = v;

  @action
  void setPassword(String v) => password = v;

  @action
  void setName(String v) => name = v;

  @action
  void setNickname(String v) => nickname = v;

  @action
  void setBio(String v) => bio = v;

  @action
  void setGender(String v) => gender = v;

  @action
  void setAge(DateTime v) => age = v;

  Future<bool> signUp() async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        final isProfileCreated = await createProfile();

        if (isProfileCreated) {
          isLoading = false;
          return true;
        }

        userCredential.user?.delete();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    return false;
  }

  Future<bool> createProfile() async {
    profile = Profile(
      email: email,
      name: name,
      nickname: nickname,
      gender: gender,
      bio: bio,
      age: age,
    );

    final profileCreated = await profileRepository.createProfile(profile);
    return profileCreated;
  }

  @computed
  bool get isValid =>
      email.isNotEmpty &&
      password.isNotEmpty &&
      name.isNotEmpty &&
      nickname.isNotEmpty &&
      gender.isNotEmpty;
}
