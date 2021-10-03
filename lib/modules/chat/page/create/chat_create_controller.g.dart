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

  final _$categoryAtom = Atom(name: 'ChatCreateControllerBase.category');

  @override
  int get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(int value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  final _$pictureAtom = Atom(name: 'ChatCreateControllerBase.picture');

  @override
  String get picture {
    _$pictureAtom.reportRead();
    return super.picture;
  }

  @override
  set picture(String value) {
    _$pictureAtom.reportWrite(value, super.picture, () {
      super.picture = value;
    });
  }

  final _$imageFileAtom = Atom(name: 'ChatCreateControllerBase.imageFile');

  @override
  File? get imageFile {
    _$imageFileAtom.reportRead();
    return super.imageFile;
  }

  @override
  set imageFile(File? value) {
    _$imageFileAtom.reportWrite(value, super.imageFile, () {
      super.imageFile = value;
    });
  }

  final _$takePictureAsyncAction =
      AsyncAction('ChatCreateControllerBase.takePicture');

  @override
  Future<void> takePicture(ImageSource imageSource) {
    return _$takePictureAsyncAction.run(() => super.takePicture(imageSource));
  }

  final _$createChatAsyncAction =
      AsyncAction('ChatCreateControllerBase.createChat');

  @override
  Future<SaveResult> createChat() {
    return _$createChatAsyncAction.run(() => super.createChat());
  }

  final _$enterAsyncAction = AsyncAction('ChatCreateControllerBase.enter');

  @override
  Future<SaveResult> enter() {
    return _$enterAsyncAction.run(() => super.enter());
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
  void setCategory(int v) {
    final _$actionInfo = _$ChatCreateControllerBaseActionController.startAction(
        name: 'ChatCreateControllerBase.setCategory');
    try {
      return super.setCategory(v);
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
category: ${category},
picture: ${picture},
imageFile: ${imageFile},
isValid: ${isValid}
    ''';
  }
}
