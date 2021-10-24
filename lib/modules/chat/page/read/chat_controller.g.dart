// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatController on ChatControllerBase, Store {
  Computed<List<Profile>>? _$profilesComputed;

  @override
  List<Profile> get profiles =>
      (_$profilesComputed ??= Computed<List<Profile>>(() => super.profiles,
              name: 'ChatControllerBase.profiles'))
          .value;
  Computed<List<Message>>? _$messagesComputed;

  @override
  List<Message> get messages =>
      (_$messagesComputed ??= Computed<List<Message>>(() => super.messages,
              name: 'ChatControllerBase.messages'))
          .value;
  Computed<List<Member>>? _$membersComputed;

  @override
  List<Member> get members =>
      (_$membersComputed ??= Computed<List<Member>>(() => super.members,
              name: 'ChatControllerBase.members'))
          .value;
  Computed<String>? _$searchComputed;

  @override
  String get search =>
      (_$searchComputed ??= Computed<String>(() => super.search,
              name: 'ChatControllerBase.search'))
          .value;
  Computed<bool>? _$isDirectComputed;

  @override
  bool get isDirect =>
      (_$isDirectComputed ??= Computed<bool>(() => super.isDirect,
              name: 'ChatControllerBase.isDirect'))
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

  final _$recipientAtom = Atom(name: 'ChatControllerBase.recipient');

  @override
  String get recipient {
    _$recipientAtom.reportRead();
    return super.recipient;
  }

  @override
  set recipient(String value) {
    _$recipientAtom.reportWrite(value, super.recipient, () {
      super.recipient = value;
    });
  }

  final _$isPrivateAtom = Atom(name: 'ChatControllerBase.isPrivate');

  @override
  bool get isPrivate {
    _$isPrivateAtom.reportRead();
    return super.isPrivate;
  }

  @override
  set isPrivate(bool value) {
    _$isPrivateAtom.reportWrite(value, super.isPrivate, () {
      super.isPrivate = value;
    });
  }

  final _$sendMessageAsyncAction =
      AsyncAction('ChatControllerBase.sendMessage');

  @override
  Future<void> sendMessage() {
    return _$sendMessageAsyncAction.run(() => super.sendMessage());
  }

  final _$exitAsyncAction = AsyncAction('ChatControllerBase.exit');

  @override
  Future<void> exit() {
    return _$exitAsyncAction.run(() => super.exit());
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
  void setRecipient(String v) {
    final _$actionInfo = _$ChatControllerBaseActionController.startAction(
        name: 'ChatControllerBase.setRecipient');
    try {
      return super.setRecipient(v);
    } finally {
      _$ChatControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePrivate() {
    final _$actionInfo = _$ChatControllerBaseActionController.startAction(
        name: 'ChatControllerBase.togglePrivate');
    try {
      return super.togglePrivate();
    } finally {
      _$ChatControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
text: ${text},
recipient: ${recipient},
isPrivate: ${isPrivate},
profiles: ${profiles},
messages: ${messages},
members: ${members},
search: ${search},
isDirect: ${isDirect}
    ''';
  }
}
