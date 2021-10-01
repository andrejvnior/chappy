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
    observableFutureProfile = profileRepository.getProfiles().asObservable();

    profile = other ?? owner;
  }

  Profile? profile;
  Profile? owner;

  // TODO: Rename
  Profile? other;

  ProfileRepository profileRepository = ProfileRepository();

  ObservableStream<List<Follow>>? observableStreamFollowers;
  ObservableFuture<List<Profile>>? observableFutureProfile;


  @computed
  List<Profile> get profiles {
    if (observableFutureProfile == null) return <Profile>[];

    final list = observableFutureProfile?.value?.toList() ?? <Profile>[];

    List<Profile> profiles = <Profile>[];

    // TODO: Error here
    if (followers.isNotEmpty) {
      for (final follower in followers) {
        final profile =
            list.where((element) => element.uuid == follower.uuid).first;

        profiles.add(profile);
      }
    }

    return profiles;
  }

  @computed
  List<Follow> get followers {
    if (observableStreamFollowers == null) return <Follow>[];

    final list = observableStreamFollowers?.value?.toList() ?? <Follow>[];
    return list;
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
