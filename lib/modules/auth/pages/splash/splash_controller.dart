import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:projects/modules/profile/models/profile.dart';
import 'package:projects/modules/profile/repositories/profile_repository.dart';

part 'splash_controller.g.dart';

class SplashController = SplashControllerBase with _$SplashController;

abstract class SplashControllerBase with Store {
  SplashControllerBase();

  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  ProfileRepository profileRepository = ProfileRepository();

  Profile profile = Profile();

  @computed
  bool get isLogged {
    return auth.currentUser != null;
  }

  @action
  Future<void> getProfile() async {
    profile = await profileRepository.getProfile(auth.currentUser?.email ?? '');
  }
}
