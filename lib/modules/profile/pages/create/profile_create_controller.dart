import 'dart:io';
import 'dart:math';

import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projects/core/extensions.dart';
import 'package:projects/models/firebase_model.dart';
import 'package:projects/modules/camera/models/camera.dart';
import 'package:projects/modules/profile/repositories/profile_repository.dart';

import 'package:projects/modules/profile/models/profile.dart';

part 'profile_create_controller.g.dart';

class ProfileCreateController = ProfileCreateControllerBase
    with _$ProfileCreateController;

abstract class ProfileCreateControllerBase with Store {
  ProfileCreateControllerBase(this.email, {this.profile});

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  ProfileRepository profileRepository = ProfileRepository();

  Camera camera = Camera();

  Profile? originalProfile;
  Profile? profile;

  @observable
  String errorMessage = '';

  @action
  setErrorMessage() => errorMessage.isNotEmpty
      ? errorMessage
      : 'Please, insert mandatory fields.';

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

  @observable
  String bio = '';

  // TODO: Implement age choice
  @observable
  DateTime birthday = DateTime.now().subtract(const Duration(days: 8665));

  @observable
  String gender = '';

  @observable
  String city = '';

  @observable
  String country = '';

  @observable
  String picture = '';

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
  void setBio(String v) => bio = v;

  @action
  void setGender(String v) => gender = v;

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
  bool get genderValid => gender.isNotEmpty;

  // TODO: Implement birthday validation for 18+
  @computed
  bool get birthdayValid => true;

  @computed
  bool get cityValid => city.isNotEmpty;

  @computed
  bool get countryValid => country.isNotEmpty;



  @observable
  File? imageFile;

  @action
  Future<void> takePicture(ImageSource imageSource) async {
    imageFile = await camera.pickImage(imageSource);
  }

  void generateNickname() {
    List<String> list = name.split(' ');

    final generatedNickname = list[0] + Random().nextInt(10000000).toString();

    nickname = generatedNickname.toLowerCase();
  }

  Future<SaveResult> createProfile() async {
    generateNickname();

    bio = 'Hi, my name is $name';

    profile = Profile(
      email: email,
      name: name,
      nickname: nickname,
      gender: gender,
      bio: bio,
      birthday: birthday,
      city: city,
      country: country,
      picture: picture,
      interests: [],
    );

    final result = await profileRepository.createProfile(profile!);
    return result;
  }

  Future<bool> verifyNickname() async {
    if (nickname.isNotEmpty) {
      final nicknameAvailable =
          await profileRepository.verifyNickname(nickname);
      if (nicknameAvailable) return true;
    }

    if (nickname.isEmpty && profile!.nickname.isNotEmpty) return true;

    errorMessage = 'Nickname already exists';

    return false;
  }

  Future<SaveResult> updateProfile() async {
    SaveResult result;
    final nicknameAvailable = await verifyNickname();

    if (nicknameAvailable) {
      profile?.name = name.isNotEmpty ? name : profile!.name;
      profile?.nickname = nickname.isNotEmpty ? nickname : profile!.nickname;
      profile?.bio = bio.isNotEmpty ? bio : profile!.bio;
      profile?.birthday = profile!.birthday;
      profile?.city = city.isNotEmpty ? city : profile!.city;
      profile?.country = country.isNotEmpty ? country : profile!.country;
      profile?.picture = picture.isNotEmpty ? picture : profile!.picture;
      profile?.interests = profile?.interests ?? [];

      if (imageFile != null) {
        profile?.picture = await camera.upload(imageFile!);
      }

      result = await profileRepository.updateProfile(profile!);
      return result;
    } else {
      return SaveResult.failed;
    }
  }

  @computed
  bool get isValid =>
      nameValid && genderValid && birthdayValid && cityValid && countryValid;
}
