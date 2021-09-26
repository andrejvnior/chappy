// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on HomeControllerBase, Store {
  Computed<List<Chat>>? _$chatListComputed;

  @override
  List<Chat> get chatList =>
      (_$chatListComputed ??= Computed<List<Chat>>(() => super.chatList,
              name: 'HomeControllerBase.chatList'))
          .value;

  final _$categoryAtom = Atom(name: 'HomeControllerBase.category');

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

  final _$logoutAsyncAction = AsyncAction('HomeControllerBase.logout');

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase');

  @override
  void setCategory(int v) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.setCategory');
    try {
      return super.setCategory(v);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
category: ${category},
chatList: ${chatList}
    ''';
  }
}
