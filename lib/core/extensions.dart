import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get hourAndMinute => DateFormat('HH:mm').format(this);
}

extension StringExtension on String {
  bool get isEmail => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(this);
}
