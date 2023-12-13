import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String format([String pattern = 'yyyy-dd-MM']) {
    return DateFormat(pattern).format(this);
  }
}
