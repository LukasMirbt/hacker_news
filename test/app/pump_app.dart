// ignore_for_file: prefer_const_constructors

import 'package:analytics_repository/analytics_repository.dart';
import 'package:app_ui/app_ui.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:feed_api/feed_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app/app.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/authentication/authentication.dart'
    as authentication;
import 'package:hacker_client/authentication/authentication.dart'
    hide AuthenticationState;
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/theme/theme.dart';
import 'package:hacker_client/version/version.dart';
import 'package:hacker_client/vote_failure/vote_failure.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_api/post_api.dart';
import 'package:post_repository/post_repository.dart';
import 'package:provider/provider.dart';
import 'package:reply_repository/reply_repository.dart';
import 'package:thread_api/thread_api.dart';
import 'package:version_repository/version_repository.dart';
import 'package:visited_post_repository/visited_post_repository.dart';
import 'package:vote_repository/vote_repository.dart';

class _MockAuthenticationApi extends Mock implements AuthenticationApi {}

class _MockFeedApi extends Mock implements FeedApi {}

class _MockPostApi extends Mock implements PostApi {}

class _MockThreadApi extends Mock implements ThreadApi {}

class _MockAnalyticsRepository extends Mock implements AnalyticsRepository {
  @override
  Future<bool> isAnalyticsCollectionEnabled() async => false;
}

class _MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {
  @override
  AuthenticationState get state => AuthenticationStatePlaceholder();

  @override
  Stream<AuthenticationState> get stream => Stream.empty();

  @override
  Future<List<Cookie>> cookies() async => [];
}

class _MockReplyRepository extends Mock implements ReplyRepository {
  @override
  Stream<ReplyUpdate> get stream => Stream.empty();
}

class _MockVersionRepository extends Mock implements VersionRepository {
  @override
  Future<Version> currentVersion() async => Version(1, 0, 0);
}

class _MockVisitedPostRepository extends Mock implements VisitedPostRepository {
  @override
  VisitedPostState get state => VisitedPostState();

  @override
  Stream<VisitedPostState> get stream => Stream.empty();
}

class _MockVoteRepository extends Mock implements VoteRepository {
  @override
  VoteState get state => VoteInitial();

  @override
  Stream<VoteState> get stream => Stream.empty();
}

class _MockAppBloc extends MockBloc<AppEvent, AppState> implements AppBloc {
  @override
  AppState get state => AppState();
}

class _MockAppRouter extends Mock implements AppRouter {}

class _MockAuthenticationBloc
    extends MockBloc<AuthenticationEvent, authentication.AuthenticationState>
    implements AuthenticationBloc {
  @override
  authentication.AuthenticationState get state =>
      authentication.AuthenticationState(
        user: User.empty,
        redirect: LoginRedirect.initial,
        status: AuthenticationStatus.unauthenticated,
      );
}

class _MockThemeBloc extends MockBloc<ThemeEvent, ThemeState>
    implements ThemeBloc {
  @override
  ThemeState get state => ThemeState();
}

class _MockVersionBloc extends MockBloc<VersionEvent, VersionState>
    implements VersionBloc {
  @override
  VersionState get state => VersionState();
}

class _MockVoteFailureBloc extends MockBloc<VoteFailureEvent, VoteState>
    implements VoteFailureBloc {
  @override
  VoteState get state => VoteInitial();
}

class _MockGoRouter extends Mock implements GoRouter {}

typedef MaterialAppBuilder =
    Widget Function(
      ThemeData lightTheme,
      ThemeData darkTheme,
      Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates,
      Iterable<Locale> supportedLocales,
    );

extension PumpAppExtension on WidgetTester {
  Future<void> _pumpApp(MaterialAppBuilder builder) async {
    return pumpWidget(
      MultiProvider(
        providers: [
          Provider<AuthenticationApi>(
            create: (_) => _MockAuthenticationApi(),
          ),
          Provider<FeedApi>(
            create: (_) => _MockFeedApi(),
          ),
          Provider<PostApi>(
            create: (_) => _MockPostApi(),
          ),
          Provider<ThreadApi>(
            create: (_) => _MockThreadApi(),
          ),
        ],
        child: MultiRepositoryProvider(
          providers: [
            RepositoryProvider<AnalyticsRepository>(
              create: (_) => _MockAnalyticsRepository(),
            ),
            RepositoryProvider<AuthenticationRepository>(
              create: (_) => _MockAuthenticationRepository(),
            ),
            RepositoryProvider<ReplyRepository>(
              create: (_) => _MockReplyRepository(),
            ),
            RepositoryProvider<VersionRepository>(
              create: (_) => _MockVersionRepository(),
            ),
            RepositoryProvider<VisitedPostRepository>(
              create: (_) => _MockVisitedPostRepository(),
            ),
            RepositoryProvider<VoteRepository>(
              create: (_) => _MockVoteRepository(),
            ),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider<AppBloc>(
                create: (_) => _MockAppBloc(),
              ),

              BlocProvider<AuthenticationBloc>(
                create: (_) => _MockAuthenticationBloc(),
              ),
              BlocProvider<ThemeBloc>(
                create: (_) => _MockThemeBloc(),
              ),
              BlocProvider<VersionBloc>(
                create: (_) => _MockVersionBloc(),
              ),
              BlocProvider<VoteFailureBloc>(
                create: (_) => _MockVoteFailureBloc(),
              ),
            ],
            child: Provider<AppRouter>(
              create: (_) => _MockAppRouter(),
              child: builder(
                const LightTheme().themeData,
                const DarkTheme().themeData,
                const [
                  ...AppLocalizations.localizationsDelegates,
                  ...AppUiLocalizations.localizationsDelegates,
                  ...DateFormatterLocalizations.localizationsDelegates,
                ],
                const [
                  ...AppLocalizations.supportedLocales,
                  ...AppUiLocalizations.supportedLocales,
                  ...DateFormatterLocalizations.supportedLocales,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> pumpApp(Widget widgetUnderTest) async {
    return _pumpApp(
      (
        lightTheme,
        darkTheme,
        localizationsDelegates,
        supportedLocales,
      ) {
        return MaterialApp(
          home: InheritedGoRouter(
            goRouter: _MockGoRouter(),
            child: Scaffold(body: widgetUnderTest),
          ),
          theme: lightTheme,
          darkTheme: darkTheme,
          localizationsDelegates: localizationsDelegates,
          supportedLocales: supportedLocales,
        );
      },
    );
  }

  Future<void> pumpAppWithRouter(GoRouter routerConfig) async {
    return _pumpApp(
      (
        lightTheme,
        darkTheme,
        localizationsDelegates,
        supportedLocales,
      ) {
        return MaterialApp.router(
          routerConfig: routerConfig,
          theme: lightTheme,
          darkTheme: darkTheme,
          localizationsDelegates: localizationsDelegates,
          supportedLocales: supportedLocales,
        );
      },
    );
  }

  Future<void> pumpAppWithContext(
    void Function(BuildContext) show,
  ) async {
    final widget = Container();
    await pumpApp(widget);
    final context = element(find.byWidget(widget));
    show(context);
    await pump();
  }
}
