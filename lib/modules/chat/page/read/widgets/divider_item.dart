import 'package:flutter/material.dart';
import 'package:projects/modules/chat/models/content_item.dart';

class DividerItem extends ContentItem {
  final DateTime _createdAt;
  final String _createdBy;
  final bool isSameUser;

  DividerItem(this._createdAt, this._createdBy, this.isSameUser, {Key? key});

  @override
  DateTime get createdAt => _createdAt;

  @override
  String get createdBy => _createdBy;

  @override
  int get order => 0;

  @override
  bool get isMessage => false;

  @override
  Widget build(BuildContext context) {
    if(!isSameUser) return Container(child: Text('dsfsdf'),);
    return Container(
      height: 1,
      width: 400,
      color: Colors.black,
    );
  }
}
