import 'package:flutter/material.dart';

abstract class ContentItem extends StatelessWidget{
  DateTime get createdAt;
  String get createdBy;
  int get order;
  bool get isMessage;

  int compareTo(ContentItem other){
    if(createdAt.isAtSameMomentAs(other.createdAt)){
      if(order == other.order) return createdAt.compareTo(other.createdAt);
      return order.compareTo(other.order);
    } else{
      return createdAt.compareTo(other.createdAt);
    }
  }

  bool isSameOwner(ContentItem other){
    return createdBy == other.createdBy;
  }
}