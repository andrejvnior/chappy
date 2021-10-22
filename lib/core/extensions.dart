import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get hourAndMinute => DateFormat('HH:mm').format(this);

  bool isSameMinuteAs(DateTime dateTime) =>
      dateTime.year == year &&
      dateTime.month == month &&
      dateTime.day == day &&
      dateTime.hour == hour &&
      dateTime.minute == minute &&
      dateTime.second == second &&
      dateTime.millisecond == millisecond &&
      dateTime.minute == microsecond;
}

extension StringExtension on String {
  bool get isEmail => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(this);
}
