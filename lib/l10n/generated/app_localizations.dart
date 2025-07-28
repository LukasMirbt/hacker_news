import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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

  /// No description provided for @generalServerError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get generalServerError;

  /// No description provided for @analyticsConsent_title.
  ///
  /// In en, this message translates to:
  /// **'Help us improve the app?'**
  String get analyticsConsent_title;

  /// No description provided for @analyticsConsent_explanation.
  ///
  /// In en, this message translates to:
  /// **'We use Firebase Analytics to collect anonymous usage data to helps us understand user behavior and pain points. You can opt out at any time.'**
  String get analyticsConsent_explanation;

  /// No description provided for @analyticsConsent_continue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get analyticsConsent_continue;

  /// No description provided for @analyticsConsent_skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get analyticsConsent_skip;

  /// No description provided for @appShell_home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get appShell_home;

  /// No description provided for @appShell_threads.
  ///
  /// In en, this message translates to:
  /// **'Threads'**
  String get appShell_threads;

  /// No description provided for @appShell_settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get appShell_settings;

  /// No description provided for @appShell_login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get appShell_login;

  /// No description provided for @comment_title.
  ///
  /// In en, this message translates to:
  /// **'Comment'**
  String get comment_title;

  /// No description provided for @comment_textFieldHintText.
  ///
  /// In en, this message translates to:
  /// **'Your comment'**
  String get comment_textFieldHintText;

  /// No description provided for @comment_disabledExplanationTitle.
  ///
  /// In en, this message translates to:
  /// **'Closed for comments'**
  String get comment_disabledExplanationTitle;

  /// No description provided for @comment_disabledExplanationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Threads are closed to new comments after two weeks, or if the submission has been killed by software, moderators, or user flags.'**
  String get comment_disabledExplanationSubtitle;

  /// No description provided for @comment_submitAction.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get comment_submitAction;

  /// No description provided for @commentList_age.
  ///
  /// In en, this message translates to:
  /// **'{age} ago'**
  String commentList_age({required Object age});

  /// No description provided for @commentOptions_reply.
  ///
  /// In en, this message translates to:
  /// **'Reply'**
  String get commentOptions_reply;

  /// No description provided for @commentOptions_openOnWeb.
  ///
  /// In en, this message translates to:
  /// **'Open on web'**
  String get commentOptions_openOnWeb;

  /// No description provided for @createAccount_title.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get createAccount_title;

  /// No description provided for @createAccount_explanation.
  ///
  /// In en, this message translates to:
  /// **'Creates a Hacker News account that can also be used on the Hacker News website'**
  String get createAccount_explanation;

  /// No description provided for @createAccount_usernameLabel.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get createAccount_usernameLabel;

  /// No description provided for @createAccount_usernameEmptyError.
  ///
  /// In en, this message translates to:
  /// **'Enter a username'**
  String get createAccount_usernameEmptyError;

  /// No description provided for @createAccount_passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get createAccount_passwordLabel;

  /// No description provided for @createAccount_passwordEmptyError.
  ///
  /// In en, this message translates to:
  /// **'Enter a password'**
  String get createAccount_passwordEmptyError;

  /// No description provided for @createAccount_policyLinksPart1.
  ///
  /// In en, this message translates to:
  /// **'By creating an account, you agree to the Hacker News '**
  String get createAccount_policyLinksPart1;

  /// No description provided for @createAccount_termsOfUse.
  ///
  /// In en, this message translates to:
  /// **'terms of use'**
  String get createAccount_termsOfUse;

  /// No description provided for @createAccount_policyLinksPart3.
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get createAccount_policyLinksPart3;

  /// No description provided for @createAccount_privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'privacy policy'**
  String get createAccount_privacyPolicy;

  /// No description provided for @createAccount_submitAction.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get createAccount_submitAction;

  /// No description provided for @dataCollection_title.
  ///
  /// In en, this message translates to:
  /// **'Data collection'**
  String get dataCollection_title;

  /// No description provided for @dataCollection_analytics.
  ///
  /// In en, this message translates to:
  /// **'Analytics'**
  String get dataCollection_analytics;

  /// No description provided for @feed_shareText.
  ///
  /// In en, this message translates to:
  /// **'{title} {url}'**
  String feed_shareText({required Object title, required Object url});

  /// No description provided for @feed_rank.
  ///
  /// In en, this message translates to:
  /// **'{rank}.'**
  String feed_rank({required Object rank});

  /// No description provided for @feedItemOptions_openOnWeb.
  ///
  /// In en, this message translates to:
  /// **'Open on web'**
  String get feedItemOptions_openOnWeb;

  /// No description provided for @home_topTab.
  ///
  /// In en, this message translates to:
  /// **'Top'**
  String get home_topTab;

  /// No description provided for @home_newTab.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get home_newTab;

  /// No description provided for @home_pastTab.
  ///
  /// In en, this message translates to:
  /// **'Past'**
  String get home_pastTab;

  /// No description provided for @home_askTab.
  ///
  /// In en, this message translates to:
  /// **'Ask'**
  String get home_askTab;

  /// No description provided for @home_showTab.
  ///
  /// In en, this message translates to:
  /// **'Show'**
  String get home_showTab;

  /// No description provided for @home_jobsTab.
  ///
  /// In en, this message translates to:
  /// **'Jobs'**
  String get home_jobsTab;

  /// No description provided for @home_whoIsHiringTab.
  ///
  /// In en, this message translates to:
  /// **'Who Is Hiring'**
  String get home_whoIsHiringTab;

  /// No description provided for @login_title.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login_title;

  /// No description provided for @login_instructions.
  ///
  /// In en, this message translates to:
  /// **'Use your Hacker News credentials to log in'**
  String get login_instructions;

  /// No description provided for @login_usernameLabel.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get login_usernameLabel;

  /// No description provided for @login_usernameEmptyError.
  ///
  /// In en, this message translates to:
  /// **'Enter a username'**
  String get login_usernameEmptyError;

  /// No description provided for @login_passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get login_passwordLabel;

  /// No description provided for @login_passwordEmptyError.
  ///
  /// In en, this message translates to:
  /// **'Enter a password'**
  String get login_passwordEmptyError;

  /// No description provided for @login_createAccountAction.
  ///
  /// In en, this message translates to:
  /// **'Create a Hacker News account'**
  String get login_createAccountAction;

  /// No description provided for @login_policyLinksPart1.
  ///
  /// In en, this message translates to:
  /// **'By logging in, you agree to the Hacker News '**
  String get login_policyLinksPart1;

  /// No description provided for @login_termsOfUse.
  ///
  /// In en, this message translates to:
  /// **'terms of use'**
  String get login_termsOfUse;

  /// No description provided for @login_policyLinksPart3.
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get login_policyLinksPart3;

  /// No description provided for @login_privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'privacy policy'**
  String get login_privacyPolicy;

  /// No description provided for @login_submitAction.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login_submitAction;

  /// No description provided for @loginLoading_text.
  ///
  /// In en, this message translates to:
  /// **'Logging in...'**
  String get loginLoading_text;

  /// No description provided for @logoutLoading_text.
  ///
  /// In en, this message translates to:
  /// **'Logging out...'**
  String get logoutLoading_text;

  /// No description provided for @post_title.
  ///
  /// In en, this message translates to:
  /// **'Post'**
  String get post_title;

  /// No description provided for @postOptions_openOnWeb.
  ///
  /// In en, this message translates to:
  /// **'Open on web'**
  String get postOptions_openOnWeb;

  /// No description provided for @postHeader_shareText.
  ///
  /// In en, this message translates to:
  /// **'{title} {url}'**
  String postHeader_shareText({required Object title, required Object url});

  /// No description provided for @reply_title.
  ///
  /// In en, this message translates to:
  /// **'Reply'**
  String get reply_title;

  /// No description provided for @reply_disabledExplanationTitle.
  ///
  /// In en, this message translates to:
  /// **'Closed for replies'**
  String get reply_disabledExplanationTitle;

  /// No description provided for @reply_disabledExplanationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Threads are closed to new replies after two weeks, or if the submission has been killed by software, moderators, or user flags.'**
  String get reply_disabledExplanationSubtitle;

  /// No description provided for @reply_age.
  ///
  /// In en, this message translates to:
  /// **'{age} ago'**
  String reply_age({required Object age});

  /// No description provided for @reply_textFieldHintText.
  ///
  /// In en, this message translates to:
  /// **'Your reply'**
  String get reply_textFieldHintText;

  /// No description provided for @reply_submitAction.
  ///
  /// In en, this message translates to:
  /// **'Reply'**
  String get reply_submitAction;

  /// No description provided for @replyOptions_openOnWeb.
  ///
  /// In en, this message translates to:
  /// **'Open on web'**
  String get replyOptions_openOnWeb;

  /// No description provided for @settings_logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get settings_logout;

  /// No description provided for @settings_themeSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settings_themeSectionTitle;

  /// No description provided for @settings_generalSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get settings_generalSectionTitle;

  /// No description provided for @settings_userSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get settings_userSectionTitle;

  /// No description provided for @settings_licenses.
  ///
  /// In en, this message translates to:
  /// **'Licenses'**
  String get settings_licenses;

  /// No description provided for @settings_dataCollection.
  ///
  /// In en, this message translates to:
  /// **'Data collection'**
  String get settings_dataCollection;

  /// No description provided for @settings_privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get settings_privacyPolicy;

  /// No description provided for @theme_system.
  ///
  /// In en, this message translates to:
  /// **'Use device settings'**
  String get theme_system;

  /// No description provided for @theme_light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get theme_light;

  /// No description provided for @theme_dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get theme_dark;

  /// No description provided for @threadFeed_age.
  ///
  /// In en, this message translates to:
  /// **'{age} ago'**
  String threadFeed_age({required Object age});

  /// No description provided for @threadItemOptions_reply.
  ///
  /// In en, this message translates to:
  /// **'Reply'**
  String get threadItemOptions_reply;

  /// No description provided for @threadItemOptions_viewPost.
  ///
  /// In en, this message translates to:
  /// **'View post'**
  String get threadItemOptions_viewPost;

  /// No description provided for @threadItemOptions_openOnWeb.
  ///
  /// In en, this message translates to:
  /// **'Open on web'**
  String get threadItemOptions_openOnWeb;

  /// No description provided for @voteFailure_invalidUrl.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Try refreshing the page.'**
  String get voteFailure_invalidUrl;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
