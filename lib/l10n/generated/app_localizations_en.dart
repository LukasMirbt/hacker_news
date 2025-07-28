// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get generalServerError => 'Something went wrong';

  @override
  String get analyticsConsent_title => 'Help us improve the app?';

  @override
  String get analyticsConsent_explanation =>
      'We use Firebase Analytics to collect anonymous usage data to helps us understand user behavior and pain points. You can opt out at any time.';

  @override
  String get analyticsConsent_continue => 'Continue';

  @override
  String get analyticsConsent_skip => 'Skip';

  @override
  String get appShell_home => 'Home';

  @override
  String get appShell_threads => 'Threads';

  @override
  String get appShell_settings => 'Settings';

  @override
  String get appShell_login => 'Login';

  @override
  String get comment_title => 'Comment';

  @override
  String get comment_textFieldHintText => 'Your comment';

  @override
  String get comment_disabledExplanationTitle => 'Closed for comments';

  @override
  String get comment_disabledExplanationSubtitle =>
      'Threads are closed to new comments after two weeks, or if the submission has been killed by software, moderators, or user flags.';

  @override
  String get comment_submitAction => 'Submit';

  @override
  String commentList_age({required Object age}) {
    return '$age ago';
  }

  @override
  String get commentOptions_reply => 'Reply';

  @override
  String get commentOptions_openOnWeb => 'Open on web';

  @override
  String get createAccount_title => 'Create account';

  @override
  String get createAccount_explanation =>
      'Creates a Hacker News account that can also be used on the Hacker News website';

  @override
  String get createAccount_usernameLabel => 'Username';

  @override
  String get createAccount_usernameEmptyError => 'Enter a username';

  @override
  String get createAccount_passwordLabel => 'Password';

  @override
  String get createAccount_passwordEmptyError => 'Enter a password';

  @override
  String get createAccount_policyLinksPart1 =>
      'By creating an account, you agree to the Hacker News ';

  @override
  String get createAccount_termsOfUse => 'terms of use';

  @override
  String get createAccount_policyLinksPart3 => ' and ';

  @override
  String get createAccount_privacyPolicy => 'privacy policy';

  @override
  String get createAccount_submitAction => 'Create account';

  @override
  String get dataCollection_title => 'Data collection';

  @override
  String get dataCollection_analytics => 'Analytics';

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
  String get login_instructions => 'Use your Hacker News credentials to log in';

  @override
  String get login_usernameLabel => 'Username';

  @override
  String get login_usernameEmptyError => 'Enter a username';

  @override
  String get login_passwordLabel => 'Password';

  @override
  String get login_passwordEmptyError => 'Enter a password';

  @override
  String get login_createAccountAction => 'Create a Hacker News account';

  @override
  String get login_policyLinksPart1 =>
      'By logging in, you agree to the Hacker News ';

  @override
  String get login_termsOfUse => 'terms of use';

  @override
  String get login_policyLinksPart3 => ' and ';

  @override
  String get login_privacyPolicy => 'privacy policy';

  @override
  String get login_submitAction => 'Login';

  @override
  String get loginLoading_text => 'Logging in...';

  @override
  String get logoutLoading_text => 'Logging out...';

  @override
  String get post_title => 'Post';

  @override
  String get postOptions_openOnWeb => 'Open on web';

  @override
  String postHeader_shareText({required Object title, required Object url}) {
    return '$title $url';
  }

  @override
  String get reply_title => 'Reply';

  @override
  String get reply_disabledExplanationTitle => 'Closed for replies';

  @override
  String get reply_disabledExplanationSubtitle =>
      'Threads are closed to new replies after two weeks, or if the submission has been killed by software, moderators, or user flags.';

  @override
  String reply_age({required Object age}) {
    return '$age ago';
  }

  @override
  String get reply_submitAction => 'Reply';

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
  String get settings_dataCollection => 'Data collection';

  @override
  String get settings_privacyPolicy => 'Privacy policy';

  @override
  String get theme_system => 'Use device settings';

  @override
  String get theme_light => 'Light';

  @override
  String get theme_dark => 'Dark';

  @override
  String threadFeed_age({required Object age}) {
    return '$age ago';
  }

  @override
  String get threadItemOptions_reply => 'Reply';

  @override
  String get threadItemOptions_viewPost => 'View post';

  @override
  String get threadItemOptions_openOnWeb => 'Open on web';

  @override
  String get voteFailure_invalidUrl =>
      'Something went wrong. Try refreshing the page.';
}
