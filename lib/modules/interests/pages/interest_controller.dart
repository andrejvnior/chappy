import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:projects/models/firebase_model.dart';
import 'package:projects/modules/interests/repositories/interests_repository.dart';
import 'package:projects/modules/profile/models/profile.dart';

part 'interest_controller.g.dart';

class InterestController = InterestControllerBase with _$InterestController;

abstract class InterestControllerBase with Store {
  InterestControllerBase(this.profile);

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  InterestRepository interestRepository = InterestRepository();

  Profile? profile;

  @observable
  String errorMessage = '';

  @action
  setErrorMessage() => errorMessage = 'Please, insert mandatory fields.';

  @observable
  bool isLoading = false;

  ObservableList<int>? interests = ObservableList<int>();

  @action
  toggleInterest(int i) {
    if (interests!.contains(i)) {
      interests?.remove(i);
    } else {
      interests?.add(i);
    }
  }

  @computed
  bool get isValid => interests!.isNotEmpty;

  Future<SaveResult> updateProfileInterests() async {
    final result = await interestRepository.updateProfileInterest(profile!.uuid, interests!.toList());
    return result;
  }
}
