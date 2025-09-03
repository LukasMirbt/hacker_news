// ignore_for_file: prefer_const_constructors

import 'package:analytics_repository/analytics_repository.dart';
import 'package:app/app/app.dart';
import 'package:app/feed/feed.dart';
import 'package:app_ui/app_ui.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:draft_storage/draft_storage.dart';
import 'package:feed_api/feed_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_api/post_api.dart';
import 'package:reply_repository/reply_repository.dart' hide InitialPageUrl;
import 'package:thread_api/thread_api.dart' hide InitialPageUrl;
import 'package:version_repository/version_repository.dart';
import 'package:visited_post_storage/visited_post_storage.dart';
import 'package:vote_repository/vote_repository.dart';

import '../test/app/pump_app.dart';

Future<void> pause() async {
  await Future<void>.delayed(Duration(seconds: 2));
}

class _MockAuthenticationApi extends Mock implements AuthenticationApi {}

class _MockDraftStorage extends Mock implements DraftStorage {}

class _MockFeedApi extends Mock implements FeedApi {}

class _MockPostApi extends Mock implements PostApi {}

class _MockSettingsStorage extends Mock implements SettingsStorage {
  @override
  ThemeMode readThemeMode() => ThemeMode.system;

  @override
  bool readAnalyticsConsentCompleted() => true;
}

class _MockThreadApi extends Mock implements ThreadApi {}

class _MockVisitedPostStorage extends Mock implements VisitedPostStorage {
  @override
  Set<String> read() => {};

  @override
  Stream<Set<String>> watch() => Stream.empty();
}

class _MockAnalyticsRepository extends Mock implements AnalyticsRepository {}

class _MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {
  @override
  AuthenticationState get state => AuthenticationState(
    baseUrl: Uri(),
    webRedirect: WebRedirect.empty,
  );

  @override
  Stream<AuthenticationState> get stream => Stream.empty();
}

class _MockLinkLauncher extends Mock implements LinkLauncher {}

class _MockReplyRepository extends Mock implements ReplyRepository {}

class _MockVersionRepository extends Mock implements VersionRepository {}

class _MockVoteRepository extends Mock implements VoteRepository {
  @override
  VoteState get state => VoteInitial();

  @override
  Stream<VoteState> get stream => Stream.empty();
}

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('home feed performance', () {
    late AuthenticationApi authenticationApi;
    late DraftStorage draftStorage;
    late FeedApi feedApi;
    late PostApi postApi;
    late SettingsStorage settingsStorage;
    late ThreadApi threadApi;
    late VisitedPostStorage visitedPostStorage;
    late AnalyticsRepository analyticsRepository;
    late AuthenticationRepository authenticationRepository;
    late LinkLauncher linkLauncher;
    late ReplyRepository replyRepository;
    late VersionRepository versionRepository;
    late VoteRepository voteRepository;

    var rank = 0;

    setUp(() {
      authenticationApi = _MockAuthenticationApi();
      draftStorage = _MockDraftStorage();
      feedApi = _MockFeedApi();
      postApi = _MockPostApi();
      settingsStorage = _MockSettingsStorage();
      threadApi = _MockThreadApi();
      visitedPostStorage = _MockVisitedPostStorage();
      analyticsRepository = _MockAnalyticsRepository();
      authenticationRepository = _MockAuthenticationRepository();
      linkLauncher = _MockLinkLauncher();
      replyRepository = _MockReplyRepository();
      versionRepository = _MockVersionRepository();
      voteRepository = _MockVoteRepository();
      registerFallbackValue(
        InitialPageUrl(FeedType.top),
      );
      when(() => feedApi.fetchFeedPage(any())).thenAnswer(
        (_) async => FeedPageData(
          items: List.generate(
            30,
            (_) {
              rank += 1;
              return PostFeedItemDataPlaceholder(
                titleRowData: PostTitleRowDataPlaceholder(
                  base: BaseTitleRowDataPlaceholder(
                    rank: rank,
                  ),
                ),
              );
            },
          ),
          moreLink: 'moreLink',
        ),
      );
    });

    Widget buildSubject() {
      return App(
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
      );
    }

    testWidgets('scroll to item 100', (tester) async {
      await tester.pumpApp(buildSubject());

      expect(find.byType(FeedPage), findsOneWidget);

      final listFinder = find.descendant(
        of: find.byType(FeedPage),
        matching: find.byType(Scrollable),
      );

      expect(listFinder, findsOneWidget);

      final itemFinder = find.byWidgetPredicate(
        (widget) => widget is AppFeedItem && widget.data.rank.contains('100'),
      );

      await binding.traceAction(
        () async {
          await tester.scrollUntilVisible(
            itemFinder,
            500,
            scrollable: listFinder,
          );
        },
        reportKey: 'scrolling_timeline',
      );

      expect(itemFinder, findsOneWidget);
    });
  });
}
