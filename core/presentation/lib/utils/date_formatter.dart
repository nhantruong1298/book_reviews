import 'package:intl/intl.dart';
import 'package:presentation/resources/app_constants.dart';

class DateFormatter {
  static DateTime toLocalDate(DateTime date, bool toLocal) {
    return toLocal ? date.toLocal() : date;
  }

  static String toFullDateTimeFormat(DateTime? date,
      {bool toLocal = true, bool showGMT = true}) {
    if (date == null) return '';

    final DateFormat formatter = DateFormat(AppConstants.fullDateTimeFormat);
    if (showGMT) {
      return '${formatter.format(toLocalDate(date, toLocal))} (GMT +${date.toLocal().timeZoneOffset.inHours})';
    } else {
      return formatter.format(toLocalDate(date, toLocal));
    }
  }

  static String toDateAndMonthFormat(DateTime? date,
      {bool toLocal = true, bool showGMT = true}) {
    if (date == null) return '';

    final DateFormat formatter = DateFormat(AppConstants.dateAndMonthFormat);
    if (showGMT) {
      return formatter.format(toLocalDate(date, toLocal));
    } else {
      return formatter.format(toLocalDate(date, toLocal));
    }
  }
}
