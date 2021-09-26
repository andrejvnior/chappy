// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatController on ChatControllerBase, Store {
  Computed<List<Profile>>? _$profileListComputed;

  @override
  List<Profile> get profileList => (_$profileListComputed ??=
          Computed<List<Profile>>(() => super.profileList,
              name: 'ChatControllerBase.profileList'))
      .value;
  Computed<List<Message>>? _$messageListComputed;

  @override
  List<Message> get messageList => (_$messageListComputed ??=
          Computed<List<Message>>(() => super.messageList,
              name: 'ChatControllerBase.messageList'))
      .value;
  Computed<List<Member>>? _$memberListComputed;

  @override
  List<Member> get memberList =>
      (_$memberListComputed ??= Computed<List<Member>>(() => super.memberList,
              name: 'ChatControllerBase.memberList'))
          .value;

  final _$isLoadingAtom = Atom(name: 'ChatControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$textAtom = Atom(name: 'ChatControllerBase.text');

  @override
  String get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  final _$sendMessageAsyncAction =
      AsyncAction('ChatControllerBase.sendMessage');

  @override
  Future<void> sendMessage() {
    return _$sendMessageAsyncAction.run(() => super.sendMessage());
  }

  final _$logoutMemberAsyncAction =
      AsyncAction('ChatControllerBase.logoutMember');

  @override
  Future<void> logoutMember() {
    return _$logoutMemberAsyncAction.run(() => super.logoutMember());
  }

  final _$ChatControllerBaseActionController =
      ActionController(name: 'ChatControllerBase');

  @override
  void setText(String v) {
    final _$actionInfo = _$ChatControllerBaseActionController.startAction(
        name: 'ChatControllerBase.setText');
    try {
      return super.setText(v);
    } finally {
      _$ChatControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
text: ${text},
profileList: ${profileList},
messageList: ${messageList},
memberList: ${memberList}
    ''';
  }
}
