import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'date_formatter_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of DateFormatterLocalizations
/// returned by `DateFormatterLocalizations.of(context)`.
///
/// Applications need to include `DateFormatterLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/date_formatter_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: DateFormatterLocalizations.localizationsDelegates,
///   supportedLocales: DateFormatterLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the DateFormatterLocalizations.supportedLocales
/// property.
abstract class DateFormatterLocalizations {
  DateFormatterLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static DateFormatterLocalizations of(BuildContext context) {
    return Localizations.of<DateFormatterLocalizations>(
        context, DateFormatterLocalizations)!;
  }

  static const LocalizationsDelegate<DateFormatterLocalizations> delegate =
      _DateFormatterLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @minutes.
  ///
  /// In en, this message translates to:
  /// **'{minutes}m'**
  String minutes({required Object minutes});

  /// No description provided for @hours.
  ///
  /// In en, this message translates to:
  /// **'{hours}h'**
  String hours({required Object hours});

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'{days}d'**
  String days({required Object days});

  /// No description provided for @months.
  ///
  /// In en, this message translates to:
  /// **'{months}mo'**
  String months({required Object months});

  /// No description provided for @years.
  ///
  /// In en, this message translates to:
  /// **'{years}y'**
  String years({required Object years});
}

class _DateFormatterLocalizationsDelegate
    extends LocalizationsDelegate<DateFormatterLocalizations> {
  const _DateFormatterLocalizationsDelegate();

  @override
  Future<DateFormatterLocalizations> load(Locale locale) {
    return SynchronousFuture<DateFormatterLocalizations>(
        lookupDateFormatterLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_DateFormatterLocalizationsDelegate old) => false;
}

DateFormatterLocalizations lookupDateFormatterLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return DateFormatterLocalizationsEn();
  }

  throw FlutterError(
      'DateFormatterLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
