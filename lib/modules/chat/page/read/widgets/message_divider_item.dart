import 'package:flutter/material.dart';
import 'package:projects/core/extensions.dart';
import 'package:projects/modules/chat/models/content_item.dart';
import 'package:projects/themes/chappy_colors.dart';
import 'package:projects/themes/chappy_texts.dart';

class MessageDividerItem extends ContentItem {
  final DateTime _createdAt;

  MessageDividerItem(this._createdAt, {Key? key});

  @override
  DateTime get createdAt => _createdAt;

  @override
  String get createdBy => '';

  @override
  int get order => 1;

  @override
  bool get isMessage => false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: 24,
        width: 100,
        margin: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: ChappyColors.lightColor,
          borderRadius: BorderRadius.circular(48),
        ),
        child: Text(
          createdAt.hourAndMinute,
          style: ChappyTexts.button2.apply(color: ChappyColors.primaryColor),
        ),
      ),
    );
  }
}
