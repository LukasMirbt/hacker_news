// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_ui_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppUiLocalizationsEn extends AppUiLocalizations {
  AppUiLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get errorTitle => 'Oops, something went wrong';

  @override
  String get errorBody => 'An unexpected issue occurred. Please try again.';

  @override
  String get middleDot => '·';
}
