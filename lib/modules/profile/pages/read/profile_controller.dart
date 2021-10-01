import 'package:mobx/mobx.dart';
import 'package:projects/models/firebase_model.dart';
import 'package:projects/modules/profile/models/follow.dart';
import 'package:projects/modules/profile/repositories/profile_repository.dart';

import 'package:projects/modules/profile/models/profile.dart';

part 'profile_controller.g.dart';

class ProfileController = ProfileControllerBase with _$ProfileController;

abstract class ProfileControllerBase with Store {
  ProfileControllerBase(this.owner, {this.other}) {
    print('Getting followers from ${(other ?? owner)?.uuid}!');
    observableStreamFollowers =
        profileRepository.followers(other ?? owner!).asObservable();

    profile = other ?? owner;
  }

  Profile? profile;
  Profile? owner;

  // TODO: Rename
  Profile? other;

  ProfileRepository profileRepository = ProfileRepository();

  ObservableStream<List<Follow>>? observableStreamFollowers;

  @computed
  List<Follow> get followers {
    print('Getting followers from ${(other ?? owner)?.uuid}!');
    if (observableStreamFollowers == null) return <Follow>[];

    print('Successfullly got followers from ${(other ?? owner)?.uuid}!');
    return observableStreamFollowers?.value?.toList() ?? <Follow>[];
  }

  @action
  Future<SaveResult> follow() async {
    final following = Follow(
      uuid: other!.uuid,
    );

    final follower = Follow(
      uuid: owner!.uuid,
    );

    return await profileRepository.follow(following, follower);
  }

  @action
  Future<SaveResult> unfollow() async {
    final following = Follow(
      uuid: other!.uuid,
    );

    final follower = Follow(
      uuid: owner!.uuid,
    );

    return await profileRepository.unfollow(following, follower);
  }

  // TODO: Rename
  @computed
  bool get isOther => other?.uuid == profile?.uuid;

  @computed
  bool get isFollowing => followers.any((follow) => follow.uuid == owner?.uuid);
}
