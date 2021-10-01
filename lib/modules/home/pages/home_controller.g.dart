// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on HomeControllerBase, Store {
  Computed<List<Chat>>? _$chatsComputed;

  @override
  List<Chat> get chats =>
      (_$chatsComputed ??= Computed<List<Chat>>(() => super.chats,
              name: 'HomeControllerBase.chats'))
          .value;

  final _$interestAtom = Atom(name: 'HomeControllerBase.interest');

  @override
  int get interest {
    _$interestAtom.reportRead();
    return super.interest;
  }

  @override
  set interest(int value) {
    _$interestAtom.reportWrite(value, super.interest, () {
      super.interest = value;
    });
  }

  final _$getProfileAsyncAction = AsyncAction('HomeControllerBase.getProfile');

  @override
  Future<void> getProfile() {
    return _$getProfileAsyncAction.run(() => super.getProfile());
  }

  final _$createMemberAsyncAction =
      AsyncAction('HomeControllerBase.createMember');

  @override
  Future<void> createMember(Chat chat) {
    return _$createMemberAsyncAction.run(() => super.createMember(chat));
  }

  final _$logoutAsyncAction = AsyncAction('HomeControllerBase.logout');

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase');

  @override
  void setInterest(int v) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.setInterest');
    try {
      return super.setInterest(v);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
interest: ${interest},
chats: ${chats}
    ''';
  }
}
