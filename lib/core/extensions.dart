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

  String get abbrDate {
    int time = DateTime.now().difference(this).inSeconds;
    const minute = 60;
    const hour = 3600;
    const day = 86400;

    if (time == 0) {
      return 'Now';
    } else if (time < 59) {
      return '${time}s';
    } else if (time >= minute && time < hour) {
      time = DateTime.now().difference(this).inMinutes;
      return '${time}m';
    } else if (time >= hour && time < day) {
      time = DateTime.now().difference(this).inHours;
      return '${time}h';
    } else if (time >= day) {
      time = DateTime.now().difference(this).inDays;
      return '${time}d';
    }

    return simpleDate;
  }

  String get simpleDate => DateFormat('dd/MM/yyyy').format(this);
}

extension StringExtension on String {
  bool get isEmail => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(this);
}
