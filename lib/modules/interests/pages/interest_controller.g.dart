// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interest_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InterestController on InterestControllerBase, Store {
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: 'InterestControllerBase.isValid'))
      .value;

  final _$errorMessageAtom = Atom(name: 'InterestControllerBase.errorMessage');

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

  final _$isLoadingAtom = Atom(name: 'InterestControllerBase.isLoading');

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

  final _$InterestControllerBaseActionController =
      ActionController(name: 'InterestControllerBase');

  @override
  dynamic setErrorMessage() {
    final _$actionInfo = _$InterestControllerBaseActionController.startAction(
        name: 'InterestControllerBase.setErrorMessage');
    try {
      return super.setErrorMessage();
    } finally {
      _$InterestControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleInterest(int i) {
    final _$actionInfo = _$InterestControllerBaseActionController.startAction(
        name: 'InterestControllerBase.toggleInterest');
    try {
      return super.toggleInterest(i);
    } finally {
      _$InterestControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
isLoading: ${isLoading},
isValid: ${isValid}
    ''';
  }
}
