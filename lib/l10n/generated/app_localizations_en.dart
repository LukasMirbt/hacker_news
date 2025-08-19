// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get cancel => 'Cancel';

  @override
  String get generalServerError => 'Something went wrong';

  @override
  String get analyticsConsent_title => 'Help improve the app?';

  @override
  String get analyticsConsent_explanationPart1 =>
      'We use Firebase Analytics to collect anonymous usage data to help us understand user behavior and pain points.';

  @override
  String get analyticsConsent_explanationPart2 => ' Learn more in our ';

  @override
  String get analyticsConsent_privacyPolicy => 'privacy policy';

  @override
  String get analyticsConsent_explanationPart4 => '.';

  @override
  String get analyticsConsent_agreeAction => 'Help improve';

  @override
  String get analyticsConsent_declineAction => 'No, thanks';

  @override
  String get appShell_home => 'Home';

  @override
  String get appShell_threads => 'Threads';

  @override
  String get appShell_drafts => 'Drafts';

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
  String commentList_age({required String age}) {
    return '$age ago';
  }

  @override
  String commentList_score({required int score}) {
    return '${score}p';
  }

  @override
  String get commentOptions_reply => 'Reply';

  @override
  String get commentOptions_share => 'Share';

  @override
  String get commentOptions_openOnWeb => 'Open on web';

  @override
  String get contentSettings_title => 'Content';

  @override
  String get contentSettings_linkSectionTitle => 'Links';

  @override
  String get contentSettings_inAppBrowserLaunchModeTitle => 'In-app browser';

  @override
  String get contentSettings_inAppBrowserLaunchModeSubtitleIOS =>
      'Opens links inside the app';

  @override
  String get contentSettings_inAppBrowserLaunchModeSubtitleAndroid =>
      'Opens links inside the app. Some links may open their dedicated app.';

  @override
  String get contentSettings_defaultBrowserLaunchModeTitle => 'Default browser';

  @override
  String get contentSettings_defaultBrowserLaunchModeSubtitle =>
      'Opens links in the default browser or another app';

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
  String get commentDraftOptions_viewPost => 'View post';

  @override
  String get commentDraftOptions_delete => 'Delete draft';

  @override
  String get dataCollection_title => 'Data collection';

  @override
  String get dataCollection_analytics => 'Analytics';

  @override
  String get deleteDraft_title => 'Delete draft';

  @override
  String get deleteDraft_content => 'The draft will be permanently deleted';

  @override
  String get deleteDraft_confirmAction => 'Delete';

  @override
  String feed_shareText({required String title, required String url}) {
    return '$title $url';
  }

  @override
  String feed_rank({required int rank}) {
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
  String postHeader_shareText({required String title, required String url}) {
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
  String reply_age({required String age}) {
    return '$age ago';
  }

  @override
  String reply_score({required int score}) {
    return '${score}p';
  }

  @override
  String get reply_textFieldHintText => 'Your reply';

  @override
  String get reply_submitAction => 'Submit';

  @override
  String get replyDraftOptions_delete => 'Delete draft';

  @override
  String get replyOptions_share => 'Share';

  @override
  String get replyOptions_openOnWeb => 'Open on web';

  @override
  String get settings_logout => 'Logout';

  @override
  String get settings_theme => 'Theme';

  @override
  String get settings_licenses => 'Licenses';

  @override
  String get settings_dataCollection => 'Data collection';

  @override
  String get settings_privacyPolicy => 'Privacy policy';

  @override
  String get settings_userSectionTitle => 'User';

  @override
  String get theme_title => 'Theme';

  @override
  String get theme_systemMode => 'Use device settings';

  @override
  String get theme_lightMode => 'Light';

  @override
  String get theme_darkMode => 'Dark';

  @override
  String threadFeed_age({required String age}) {
    return '$age ago';
  }

  @override
  String get threadCommentOptions_reply => 'Reply';

  @override
  String get threadCommentOptions_viewPost => 'View post';

  @override
  String get threadCommentOptions_share => 'Share';

  @override
  String get threadCommentOptions_openOnWeb => 'Open on web';

  @override
  String get voteFailure_invalidUrl =>
      'Something went wrong. Try refreshing the page.';
}
