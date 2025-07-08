// ignore_for_file: constant_identifier_names

import 'package:clock/clock.dart';
import 'package:date_formatter/date_formatter.dart';

export 'l10n/l10n.dart';

class DateFormatter {
  const DateFormatter();

  static const _oneHour = Duration(hours: 1);
  static const _oneDay = Duration(days: 1);
  static const _thirtyDays = Duration(days: 30);
  static const _365Days = Duration(days: 365);

  String format(
    DateFormatterLocalizations l10n,
    DateTime date,
  ) {
    final now = clock.now().toUtc();
    final difference = now.difference(date);

    if (difference < _oneHour) {
      final minutes = difference.inMinutes;
      return l10n.minutes(minutes: minutes);
    }
    if (difference < _oneDay) {
      final hours = difference.inHours;
      return l10n.hours(hours: hours);
    }
    if (difference < _thirtyDays) {
      final days = difference.inDays;
      return l10n.days(days: days);
    }
    if (difference < _365Days) {
      final months = difference.inDays ~/ 30;
      return l10n.months(months: months);
    }
    final years = difference.inDays ~/ 365;
    return l10n.years(years: years);
  }
}
