import 'package:analytics_repository/analytics_repository.dart';
import 'package:app_client_platform_configuration/app_client_platform_configuration.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:feed_api/feed_api.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/app/app.dart';
import 'package:hacker_client/firebase_options.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:persistent_storage/persistent_storage.dart';
import 'package:post_repository/post_repository.dart';
import 'package:reply_repository/reply_repository.dart';
import 'package:secure_cookie_storage/secure_cookie_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thread_api/thread_api.dart';
import 'package:version_repository/version_repository.dart';
import 'package:visited_post_repository/visited_post_repository.dart';
import 'package:vote_repository/vote_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = SharedPreferencesAsync();

  final persistentStorage = PersistentStorage(
    sharedPreferences: sharedPreferences,
  );

  final directory = await getApplicationDocumentsDirectory();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(directory.path),
  );

  await Hive.initFlutter();

  final commentStorage = await CommentStorage.init();

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

  final analyticsRepository = AnalyticsRepository(
    firebaseApp,
    firebaseAnalytics: FirebaseAnalytics.instance,
    consentStorage: AnalyticsConsentStorage(
      storage: persistentStorage,
    ),
  );

  Bloc.observer = AppBlocObserver(
    analyticsRepository: analyticsRepository,
    logger: logger,
  );

  final cookieJar = PersistCookieJar(
    storage: const SecureCookieStorage(),
  );

  final appClient = AppClient(
    baseUrl: Uri.parse('https://news.ycombinator.com/'),
    cookieJar: cookieJar,
    addPlatformConfiguration: addPlatformConfiguration,
    debugPrint: debugPrint,
  );

  await appClient.start();

  final authenticationApi = AuthenticationApi(appClient: appClient);
  final feedApi = FeedApi(appClient: appClient);
  final postApi = PostApi(appClient: appClient);
  final replyApi = ReplyApi(appClient: appClient);
  final threadApi = ThreadApi(appClient: appClient);
  final voteApi = VoteApi(appClient: appClient);

  final authenticationRepository = AuthenticationRepository(
    authenticationApi: authenticationApi,
  );

  final replyRepository = ReplyRepository(
    replyApi: replyApi,
    userReplyService: UserReplyService(
      authenticationApi: authenticationApi,
    ),
  );

  final versionRepository = VersionRepository();
  final visitedPostRepository = VisitedPostRepository();

  final voteRepository = VoteRepository(
    authenticationApi: authenticationApi,
    voteApi: voteApi,
  );

  runApp(
    App(
      authenticationApi: authenticationApi,
      commentStorage: commentStorage,
      feedApi: feedApi,
      postApi: postApi,
      threadApi: threadApi,
      analyticsRepository: analyticsRepository,
      authenticationRepository: authenticationRepository,
      replyRepository: replyRepository,
      versionRepository: versionRepository,
      visitedPostRepository: visitedPostRepository,
      voteRepository: voteRepository,
    ),
  );
}
