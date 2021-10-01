// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileController on ProfileControllerBase, Store {
  Computed<List<Follow>>? _$followersComputed;

  @override
  List<Follow> get followers =>
      (_$followersComputed ??= Computed<List<Follow>>(() => super.followers,
              name: 'ProfileControllerBase.followers'))
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

  @override
  String toString() {
    return '''
followers: ${followers},
isOther: ${isOther},
isFollowing: ${isFollowing}
    ''';
  }
}
