// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_create_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileCreateController on ProfileCreateControllerBase, Store {
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: 'ProfileCreateControllerBase.emailValid'))
          .value;
  Computed<bool>? _$passwordValidComputed;

  @override
  bool get passwordValid =>
      (_$passwordValidComputed ??= Computed<bool>(() => super.passwordValid,
              name: 'ProfileCreateControllerBase.passwordValid'))
          .value;
  Computed<bool>? _$confirmPasswordValidComputed;

  @override
  bool get confirmPasswordValid => (_$confirmPasswordValidComputed ??=
          Computed<bool>(() => super.confirmPasswordValid,
              name: 'ProfileCreateControllerBase.confirmPasswordValid'))
      .value;
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: 'ProfileCreateControllerBase.nameValid'))
          .value;
  Computed<bool>? _$nicknameValidComputed;

  @override
  bool get nicknameValid =>
      (_$nicknameValidComputed ??= Computed<bool>(() => super.nicknameValid,
              name: 'ProfileCreateControllerBase.nicknameValid'))
          .value;
  Computed<bool>? _$genderValidComputed;

  @override
  bool get genderValid =>
      (_$genderValidComputed ??= Computed<bool>(() => super.genderValid,
              name: 'ProfileCreateControllerBase.genderValid'))
          .value;
  Computed<bool>? _$birthdayValidComputed;

  @override
  bool get birthdayValid =>
      (_$birthdayValidComputed ??= Computed<bool>(() => super.birthdayValid,
              name: 'ProfileCreateControllerBase.birthdayValid'))
          .value;
  Computed<bool>? _$cityValidComputed;

  @override
  bool get cityValid =>
      (_$cityValidComputed ??= Computed<bool>(() => super.cityValid,
              name: 'ProfileCreateControllerBase.cityValid'))
          .value;
  Computed<bool>? _$countryValidComputed;

  @override
  bool get countryValid =>
      (_$countryValidComputed ??= Computed<bool>(() => super.countryValid,
              name: 'ProfileCreateControllerBase.countryValid'))
          .value;
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: 'ProfileCreateControllerBase.isValid'))
      .value;

  final _$errorMessageAtom =
      Atom(name: 'ProfileCreateControllerBase.errorMessage');

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

  final _$isLoadingAtom = Atom(name: 'ProfileCreateControllerBase.isLoading');

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

  final _$emailAtom = Atom(name: 'ProfileCreateControllerBase.email');

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

  final _$passwordAtom = Atom(name: 'ProfileCreateControllerBase.password');

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

  final _$confirmPasswordAtom =
      Atom(name: 'ProfileCreateControllerBase.confirmPassword');

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  final _$nameAtom = Atom(name: 'ProfileCreateControllerBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$nicknameAtom = Atom(name: 'ProfileCreateControllerBase.nickname');

  @override
  String get nickname {
    _$nicknameAtom.reportRead();
    return super.nickname;
  }

  @override
  set nickname(String value) {
    _$nicknameAtom.reportWrite(value, super.nickname, () {
      super.nickname = value;
    });
  }

  final _$birthdayAtom = Atom(name: 'ProfileCreateControllerBase.birthday');

  @override
  DateTime get birthday {
    _$birthdayAtom.reportRead();
    return super.birthday;
  }

  @override
  set birthday(DateTime value) {
    _$birthdayAtom.reportWrite(value, super.birthday, () {
      super.birthday = value;
    });
  }

  final _$genderAtom = Atom(name: 'ProfileCreateControllerBase.gender');

  @override
  Gender? get gender {
    _$genderAtom.reportRead();
    return super.gender;
  }

  @override
  set gender(Gender? value) {
    _$genderAtom.reportWrite(value, super.gender, () {
      super.gender = value;
    });
  }

  final _$cityAtom = Atom(name: 'ProfileCreateControllerBase.city');

  @override
  String get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(String value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  final _$countryAtom = Atom(name: 'ProfileCreateControllerBase.country');

  @override
  String get country {
    _$countryAtom.reportRead();
    return super.country;
  }

  @override
  set country(String value) {
    _$countryAtom.reportWrite(value, super.country, () {
      super.country = value;
    });
  }

  final _$ProfileCreateControllerBaseActionController =
      ActionController(name: 'ProfileCreateControllerBase');

  @override
  dynamic setErrorMessage() {
    final _$actionInfo = _$ProfileCreateControllerBaseActionController
        .startAction(name: 'ProfileCreateControllerBase.setErrorMessage');
    try {
      return super.setErrorMessage();
    } finally {
      _$ProfileCreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading() {
    final _$actionInfo = _$ProfileCreateControllerBaseActionController
        .startAction(name: 'ProfileCreateControllerBase.setLoading');
    try {
      return super.setLoading();
    } finally {
      _$ProfileCreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String v) {
    final _$actionInfo = _$ProfileCreateControllerBaseActionController
        .startAction(name: 'ProfileCreateControllerBase.setEmail');
    try {
      return super.setEmail(v);
    } finally {
      _$ProfileCreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String v) {
    final _$actionInfo = _$ProfileCreateControllerBaseActionController
        .startAction(name: 'ProfileCreateControllerBase.setPassword');
    try {
      return super.setPassword(v);
    } finally {
      _$ProfileCreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String v) {
    final _$actionInfo = _$ProfileCreateControllerBaseActionController
        .startAction(name: 'ProfileCreateControllerBase.setConfirmPassword');
    try {
      return super.setConfirmPassword(v);
    } finally {
      _$ProfileCreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String v) {
    final _$actionInfo = _$ProfileCreateControllerBaseActionController
        .startAction(name: 'ProfileCreateControllerBase.setName');
    try {
      return super.setName(v);
    } finally {
      _$ProfileCreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNickname(String v) {
    final _$actionInfo = _$ProfileCreateControllerBaseActionController
        .startAction(name: 'ProfileCreateControllerBase.setNickname');
    try {
      return super.setNickname(v);
    } finally {
      _$ProfileCreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGender(Gender v) {
    final _$actionInfo = _$ProfileCreateControllerBaseActionController
        .startAction(name: 'ProfileCreateControllerBase.setGender');
    try {
      return super.setGender(v);
    } finally {
      _$ProfileCreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBirthday(DateTime v) {
    final _$actionInfo = _$ProfileCreateControllerBaseActionController
        .startAction(name: 'ProfileCreateControllerBase.setBirthday');
    try {
      return super.setBirthday(v);
    } finally {
      _$ProfileCreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCity(String v) {
    final _$actionInfo = _$ProfileCreateControllerBaseActionController
        .startAction(name: 'ProfileCreateControllerBase.setCity');
    try {
      return super.setCity(v);
    } finally {
      _$ProfileCreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCountry(String v) {
    final _$actionInfo = _$ProfileCreateControllerBaseActionController
        .startAction(name: 'ProfileCreateControllerBase.setCountry');
    try {
      return super.setCountry(v);
    } finally {
      _$ProfileCreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
isLoading: ${isLoading},
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword},
name: ${name},
nickname: ${nickname},
birthday: ${birthday},
gender: ${gender},
city: ${city},
country: ${country},
emailValid: ${emailValid},
passwordValid: ${passwordValid},
confirmPasswordValid: ${confirmPasswordValid},
nameValid: ${nameValid},
nicknameValid: ${nicknameValid},
genderValid: ${genderValid},
birthdayValid: ${birthdayValid},
cityValid: ${cityValid},
countryValid: ${countryValid},
isValid: ${isValid}
    ''';
  }
}
