// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileController on ProfileControllerBase, Store {
  Computed<List<Profile>>? _$profilesComputed;

  @override
  List<Profile> get profiles =>
      (_$profilesComputed ??= Computed<List<Profile>>(() => super.profiles,
              name: 'ProfileControllerBase.profiles'))
          .value;
  Computed<List<Follow>>? _$followersComputed;

  @override
  List<Follow> get followers =>
      (_$followersComputed ??= Computed<List<Follow>>(() => super.followers,
              name: 'ProfileControllerBase.followers'))
          .value;
  Computed<List<Follow>>? _$followingComputed;

  @override
  List<Follow> get following =>
      (_$followingComputed ??= Computed<List<Follow>>(() => super.following,
              name: 'ProfileControllerBase.following'))
          .value;
  Computed<bool>? _$isOtherComputed;

  @override
  bool get isOther => (_$isOtherComputed ??= Computed<bool>(() => super.isOther,
          name: 'ProfileControllerBase.isOther'))
      .value;
  Computed<bool>? _$isFollowingComputed;

  @override
  bool get isFollowing =>
      (_$isFollowingComputed ??= Computed<bool>(() => super.isFollowing,
              name: 'ProfileControllerBase.isFollowing'))
          .value;

  final _$profileAtom = Atom(name: 'ProfileControllerBase.profile');

  @override
  Profile? get profile {
    _$profileAtom.reportRead();
    return super.profile;
  }

  @override
  set profile(Profile? value) {
    _$profileAtom.reportWrite(value, super.profile, () {
      super.profile = value;
    });
  }

  final _$followAsyncAction = AsyncAction('ProfileControllerBase.follow');

  @override
  Future<SaveResult> follow() {
    return _$followAsyncAction.run(() => super.follow());
  }

  final _$unfollowAsyncAction = AsyncAction('ProfileControllerBase.unfollow');

  @override
  Future<SaveResult> unfollow() {
    return _$unfollowAsyncAction.run(() => super.unfollow());
  }

  final _$ProfileControllerBaseActionController =
      ActionController(name: 'ProfileControllerBase');

  @override
  void setProfile(Profile v) {
    final _$actionInfo = _$ProfileControllerBaseActionController.startAction(
        name: 'ProfileControllerBase.setProfile');
    try {
      return super.setProfile(v);
    } finally {
      _$ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
profile: ${profile},
profiles: ${profiles},
followers: ${followers},
following: ${following},
isOther: ${isOther},
isFollowing: ${isFollowing}
    ''';
  }
}
