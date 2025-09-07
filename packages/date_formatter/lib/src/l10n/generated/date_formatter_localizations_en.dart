// coverage:ignore-file

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'date_formatter_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class DateFormatterLocalizationsEn extends DateFormatterLocalizations {
  DateFormatterLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String minutes({required Object minutes}) {
    return '${minutes}m';
  }

  @override
  String hours({required Object hours}) {
    return '${hours}h';
  }

  @override
  String days({required Object days}) {
    return '${days}d';
  }

  @override
  String months({required Object months}) {
    return '${months}mo';
  }

  @override
  String years({required Object years}) {
    return '${years}y';
  }
}
