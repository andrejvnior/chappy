import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get formatHour => DateFormat('HH:mm').format(this);
}