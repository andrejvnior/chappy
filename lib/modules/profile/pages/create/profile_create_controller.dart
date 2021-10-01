import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projects/core/extensions.dart';
import 'package:projects/models/firebase_model.dart';
import 'package:projects/modules/profile/models/gender.dart';
import 'package:projects/modules/profile/repositories/profile_repository.dart';

import 'package:projects/modules/profile/models/profile.dart';

part 'profile_create_controller.g.dart';

class ProfileCreateController = ProfileCreateControllerBase
    with _$ProfileCreateController;

abstract class ProfileCreateControllerBase with Store {
  ProfileCreateControllerBase(this.email);
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  ProfileRepository profileRepository = ProfileRepository();

  Profile? profile;

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
  String confirmPassword = '';

  @observable
  String name = '';

  @observable
  String nickname = '';

  // TODO: Implement age choice
  @observable
  DateTime birthday = DateTime.now().subtract(const Duration(days: 8665));

  @observable
  Gender? gender;

  @observable
  String city = '';

  @observable
  String country = '';

  @action
  void setEmail(String v) => email = v;

  @action
  void setPassword(String v) => password = v;

  @action
  void setConfirmPassword(String v) => confirmPassword = v;

  @action
  void setName(String v) => name = v;

  @action
  void setNickname(String v) => nickname = v;

  @action
  void setGender(Gender v) => gender = v;

  @action
  void setBirthday(DateTime v) => birthday = v;

  @action
  void setCity(String v) => city = v;

  @action
  void setCountry(String v) => country = v;

  @computed
  bool get emailValid => email.isNotEmpty && email.isEmail;

  @computed
  bool get passwordValid => password.length > 6;

  @computed
  bool get confirmPasswordValid => confirmPassword == password;

  @computed
  bool get nameValid => name.isNotEmpty && name.length > 3;

  @computed
  bool get nicknameValid => nickname.isNotEmpty && name.length > 2;

  @computed
  bool get genderValid => gender != null;

  // TODO: Implement birthday validation for 18+
  @computed
  bool get birthdayValid => true;

  @computed
  bool get cityValid => city.isNotEmpty;

  @computed
  bool get countryValid => country.isNotEmpty;

  void generateNickname() {
    List<String> list = name.split(' ');

    final generatedNickname = list[0] + Random().nextInt(10000000).toString();

    nickname = generatedNickname.toLowerCase();
  }

  Future<SaveResult> createProfile() async {
    generateNickname();
    profile = Profile(
      email: email,
      name: name,
      nickname: nickname,
      gender: gender?.title ?? '',
      bio: '',
      birthday: birthday,
      city: city,
      country: country,
      interests: [],
    );

    final result = await profileRepository.createProfile(profile!);
    return result;
  }

  @computed
  bool get isValid =>
      nameValid && genderValid && birthdayValid && cityValid && countryValid;
}
