// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get generalServerError => 'Something went wrong.';

  @override
  String get analyticsConsent_continue => 'Continue';

  @override
  String get analyticsConsent_skip => 'Skip';

  @override
  String get appShell_home => 'Home';

  @override
  String get appShell_settings => 'Settings';

  @override
  String get appShell_login => 'Login';

  @override
  String get commentForm_title => 'Comment';

  @override
  String get commentForm_submitAction => 'Add comment';

  @override
  String commentList_age({required Object age}) {
    return '· $age ago';
  }

  @override
  String get commentOptions_reply => 'Reply';

  @override
  String get commentOptions_openOnWeb => 'Open on web';

  @override
  String feed_shareText({required Object title, required Object url}) {
    return '$title $url';
  }

  @override
  String feed_rank({required Object rank}) {
    return '$rank.';
  }

  @override
  String get feedItemOptions_openOnWeb => 'Open on web';

  @override
  String get home_topTab => 'Top';

  @override
  String get home_newTab => 'New';

  @override
  String get home_pastTab => 'Past';

  @override
  String get home_askTab => 'Ask';

  @override
  String get home_showTab => 'Show';

  @override
  String get home_jobsTab => 'Jobs';

  @override
  String get home_whoIsHiringTab => 'Who Is Hiring';

  @override
  String get login_title => 'Login';

  @override
  String get login_usernameLabel => 'Username';

  @override
  String get login_passwordLabel => 'Password';

  @override
  String get login_loginAction => 'Login';

  @override
  String get loginLoading_text => 'Logging in...';

  @override
  String get logoutLoading_text => 'Logging out...';

  @override
  String get post_title => 'Post';

  @override
  String postHeader_shareText({required Object title, required Object url}) {
    return '$title $url';
  }

  @override
  String get replyForm_title => 'Reply';

  @override
  String get replyForm_submitAction => 'Reply';

  @override
  String get settings_logout => 'Logout';

  @override
  String get settings_themeSectionTitle => 'Theme';

  @override
  String get settings_generalSectionTitle => 'General';

  @override
  String get settings_userSectionTitle => 'User';

  @override
  String get settings_licenses => 'Licenses';

  @override
  String get theme_system => 'Use device settings';

  @override
  String get theme_light => 'Light';

  @override
  String get theme_dark => 'Dark';

  @override
  String get voteFailure_invalidUrl =>
      'Something went wrong. Try refreshing the page.';
}
