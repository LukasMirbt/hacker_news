import 'package:analytics_consent_storage/analytics_consent_storage.dart';
import 'package:analytics_repository/analytics_repository.dart';
import 'package:app_client_platform_configuration/app_client_platform_configuration.dart';
import 'package:app_database/app_database.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:draft_storage/draft_storage.dart';
import 'package:feed_api/feed_api.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/app/app.dart';
import 'package:hacker_client/firebase_options.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:post_repository/post_repository.dart';
import 'package:reply_repository/reply_repository.dart';
import 'package:secure_cookie_storage/secure_cookie_storage.dart';
import 'package:secure_user_id_storage/secure_user_id_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thread_api/thread_api.dart';
import 'package:version_repository/version_repository.dart';
import 'package:visited_post_storage/visited_post_storage.dart';
import 'package:vote_repository/vote_repository.dart';

// TODO: Test Shorebird CI

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferencesWithCache.create(
    cacheOptions: const SharedPreferencesWithCacheOptions(),
  );

  final firebaseApp = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final logger = AppLogger.start(debug: kDebugMode);

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
    !kDebugMode,
  );

  final analyticsConsentStorage = AnalyticsConsentStorage(
    sharedPreferences: sharedPreferences,
  );

  final analyticsRepository = AnalyticsRepository(
    firebaseApp,
    firebaseAnalytics: FirebaseAnalytics.instance,
    analyticsConsentStorage: analyticsConsentStorage,
  );

  Bloc.observer = AppBlocObserver(
    analyticsRepository: analyticsRepository,
    logger: logger,
  );

  final cookieStorageService = await CookieStorageService.open(
    logger: logger,
  );

  final secureCookieStorage = SecureCookieStorage(
    storageService: cookieStorageService,
  );

  final cookieJar = PersistCookieJar(
    storage: secureCookieStorage,
  );

  final userIdStorageService = await UserIdStorageService.open(
    logger: logger,
  );

  final userIdStorage = SecureUserIdStorage(
    storageService: userIdStorageService,
  );

  final loggingInterceptor = PrettyDioLogger(
    responseBody: false,
    logPrint: (object) {
      if (kDebugMode) {
        debugPrint(object.toString());
      }
    },
  );

  final authenticationStatusService = AuthenticationStatusService();
  final htmlInterceptor = HtmlInterceptor();
  final loginRedirectInterceptor = LoginRedirectInterceptor();
  final webRedirectInterceptor = WebRedirectInterceptor();

  final appClient = AppClient(
    baseUrl: Uri.parse('https://news.ycombinator.com/'),
    cookieJar: cookieJar,
    userIdStorage: userIdStorage,
    authenticationStatusService: authenticationStatusService,
    loggingInterceptor: loggingInterceptor,
    htmlInterceptor: htmlInterceptor,
    loginRedirectInterceptor: loginRedirectInterceptor,
    webRedirectInterceptor: webRedirectInterceptor,
    addPlatformConfiguration: addPlatformConfiguration,
  );

  await appClient.start();

  final appDatabase = AppDatabase();

  final draftStorage = DraftStorage(appDatabase);

  final settingsStorage = SettingsStorage(
    sharedPreferences: sharedPreferences,
    logger: logger,
  );

  final visitedPostStorage = await VisitedPostStorage.open(appDatabase);

  final authenticationApi = AuthenticationApi(appClient: appClient);
  final feedApi = FeedApi(appClient: appClient);
  final postApi = PostApi(appClient: appClient);
  final replyApi = ReplyApi(appClient: appClient);
  final threadApi = ThreadApi(appClient: appClient);
  final voteApi = VoteApi(appClient: appClient);

  final authenticationRepository = AuthenticationRepository(
    authenticationApi: authenticationApi,
  );

  final linkLauncher = LinkLauncher(
    settingsStorage: settingsStorage,
  );

  final replyRepository = ReplyRepository(
    replyApi: replyApi,
    authenticationApi: authenticationApi,
    draftStorage: draftStorage,
  );

  final versionRepository = VersionRepository();

  final voteRepository = VoteRepository(
    authenticationApi: authenticationApi,
    voteApi: voteApi,
  );

  runApp(
    App(
      authenticationApi: authenticationApi,
      draftStorage: draftStorage,
      feedApi: feedApi,
      postApi: postApi,
      settingsStorage: settingsStorage,
      threadApi: threadApi,
      visitedPostStorage: visitedPostStorage,
      analyticsRepository: analyticsRepository,
      authenticationRepository: authenticationRepository,
      linkLauncher: linkLauncher,
      replyRepository: replyRepository,
      versionRepository: versionRepository,
      voteRepository: voteRepository,
    ),
  );
}
