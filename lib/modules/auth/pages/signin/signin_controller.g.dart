// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignInController on SignInControllerBase, Store {
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: 'SignInControllerBase.isValid'))
      .value;

  final _$errorMessageAtom = Atom(name: 'SignInControllerBase.errorMessage');

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

  final _$isLoadingAtom = Atom(name: 'SignInControllerBase.isLoading');

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

  final _$emailAtom = Atom(name: 'SignInControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: 'SignInControllerBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$getProfileAsyncAction =
      AsyncAction('SignInControllerBase.getProfile');

  @override
  Future<void> getProfile() {
    return _$getProfileAsyncAction.run(() => super.getProfile());
  }

  final _$SignInControllerBaseActionController =
      ActionController(name: 'SignInControllerBase');

  @override
  dynamic setErrorMessage() {
    final _$actionInfo = _$SignInControllerBaseActionController.startAction(
        name: 'SignInControllerBase.setErrorMessage');
    try {
      return super.setErrorMessage();
    } finally {
      _$SignInControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String v) {
    final _$actionInfo = _$SignInControllerBaseActionController.startAction(
        name: 'SignInControllerBase.setEmail');
    try {
      return super.setEmail(v);
    } finally {
      _$SignInControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String v) {
    final _$actionInfo = _$SignInControllerBaseActionController.startAction(
        name: 'SignInControllerBase.setPassword');
    try {
      return super.setPassword(v);
    } finally {
      _$SignInControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
isLoading: ${isLoading},
email: ${email},
password: ${password},
isValid: ${isValid}
    ''';
  }
}
