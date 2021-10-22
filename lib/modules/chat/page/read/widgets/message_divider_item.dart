import 'package:flutter/material.dart';
import 'package:projects/modules/chat/models/content_item.dart';

class MessageDividerItem extends ContentItem {
  final DateTime _createdAt;

  MessageDividerItem(this._createdAt, {Key? key});

  @override
  DateTime get createdAt => _createdAt;

  @override
  String get createdBy => '';

  @override
  int get order => 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      width: 400,
      color: Colors.black,
    );
  }
}
