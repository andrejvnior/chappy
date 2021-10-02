import 'package:mobx/mobx.dart';
import 'package:projects/models/firebase_model.dart';
import 'package:projects/modules/profile/models/follow.dart';
import 'package:projects/modules/profile/repositories/profile_repository.dart';

import 'package:projects/modules/profile/models/profile.dart';

part 'profile_controller.g.dart';

class ProfileController = ProfileControllerBase with _$ProfileController;

abstract class ProfileControllerBase with Store {
  ProfileControllerBase(this.owner,
      {this.other, this.follows = const <Follow>[]}) {
    observableStreamFollowers =
        profileRepository.followers(other ?? owner!).asObservable();
    observableStreamFollowing =
        profileRepository.following(other ?? owner!).asObservable();
    observableFutureProfile = profileRepository.getProfiles().asObservable();

    profile = other ?? owner;
    print('HWLLO');
  }

  @observable
  Profile? profile;

  Profile? owner;

  // TODO: Rename
  Profile? other;

  ProfileRepository profileRepository = ProfileRepository();

  ObservableStream<List<Follow>>? observableStreamFollowers;
  ObservableStream<List<Follow>>? observableStreamFollowing;
  ObservableFuture<List<Profile>>? observableFutureProfile;

  List<Follow> follows;

  @computed
  List<Profile> get profiles {
    if (observableFutureProfile == null) return <Profile>[];

    List<Profile> list =
        observableFutureProfile?.value?.toList() ?? <Profile>[];

    // TODO: Error here
    if (follows.isNotEmpty) {
      list = list.where((profile) {
        for (final follow in follows) {
          if (profile.uuid == follow.uuid) return true;
        }
        return false;
      }).toList();
    }

    return list;
  }

  @computed
  List<Follow> get followers {
    if (observableStreamFollowers == null) return <Follow>[];

    final list = observableStreamFollowers?.value?.toList() ?? <Follow>[];
    return list;
  }

  @computed
  List<Follow> get following {
    if (observableStreamFollowing == null) return <Follow>[];

    final list = observableStreamFollowing?.value?.toList() ?? <Follow>[];
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

    final result = await profileRepository.follow(following, follower);

    return result;
  }

  @action
  Future<SaveResult> unfollow() async {
    final following = Follow(
      uuid: other!.uuid,
    );

    final follower = Follow(
      uuid: owner!.uuid,
    );

    final result = await profileRepository.unfollow(following, follower);

    return result;
  }

  @action
  void setProfile(Profile v) => profile = v;

  // TODO: Rename
  @computed
  bool get isOther => other?.uuid == profile?.uuid;

  @computed
  bool get isFollowing => followers.any((follow) => follow.uuid == owner?.uuid);
}
