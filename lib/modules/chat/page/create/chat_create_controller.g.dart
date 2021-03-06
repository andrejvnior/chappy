// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_create_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatCreateController on ChatCreateControllerBase, Store {
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: 'ChatCreateControllerBase.isValid'))
      .value;

  final _$errorMessageAtom =
      Atom(name: 'ChatCreateControllerBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$isLoadingAtom = Atom(name: 'ChatCreateControllerBase.isLoading');

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

  final _$titleAtom = Atom(name: 'ChatCreateControllerBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$descriptionAtom = Atom(name: 'ChatCreateControllerBase.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$createChatAsyncAction =
      AsyncAction('ChatCreateControllerBase.createChat');

  @override
  Future<bool> createChat() {
    return _$createChatAsyncAction.run(() => super.createChat());
  }

  final _$ChatCreateControllerBaseActionController =
      ActionController(name: 'ChatCreateControllerBase');

  @override
  dynamic setErrorMessage() {
    final _$actionInfo = _$ChatCreateControllerBaseActionController.startAction(
        name: 'ChatCreateControllerBase.setErrorMessage');
    try {
      return super.setErrorMessage();
    } finally {
      _$ChatCreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitle(String v) {
    final _$actionInfo = _$ChatCreateControllerBaseActionController.startAction(
        name: 'ChatCreateControllerBase.setTitle');
    try {
      return super.setTitle(v);
    } finally {
      _$ChatCreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String v) {
    final _$actionInfo = _$ChatCreateControllerBaseActionController.startAction(
        name: 'ChatCreateControllerBase.setDescription');
    try {
      return super.setDescription(v);
    } finally {
      _$ChatCreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
isLoading: ${isLoading},
title: ${title},
description: ${description},
isValid: ${isValid}
    ''';
  }
}
