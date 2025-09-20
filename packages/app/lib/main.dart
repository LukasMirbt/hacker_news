import 'package:analytics_consent_storage/analytics_consent_storage.dart';
import 'package:analytics_repository/analytics_repository.dart';
import 'package:app/app/app.dart';
import 'package:app/firebase_options.dart';
import 'package:app_client_platform_configuration/app_client_platform_configuration.dart';
import 'package:app_logging/app_logging.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_cookie_storage/secure_cookie_storage.dart';
import 'package:secure_user_id_storage/secure_user_id_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferencesWithCache.create(
    cacheOptions: const SharedPreferencesWithCacheOptions(),
  );

  final firebaseApp = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final logger = AppLogging.start(
    debug: kDebugMode,
    integrations: [
      const ConsoleLoggingIntegration(),
    ],
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

  runApp(
    const App(),
  );
}
