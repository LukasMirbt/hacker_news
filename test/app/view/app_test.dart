// ignore_for_file: prefer_const_constructors

import 'package:analytics_repository/analytics_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:feed_api/feed_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/app/app.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/authentication/authentication.dart'
    hide AuthenticationState;
import 'package:hacker_client/theme/theme.dart';
import 'package:hacker_client/version/version.dart';
import 'package:hacker_client/vote_failure/vote_failure.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';
import 'package:reply_repository/reply_repository.dart';
import 'package:thread_api/thread_api.dart';
import 'package:version_repository/version_repository.dart';
import 'package:visited_post_repository/visited_post_repository.dart';
import 'package:vote_repository/vote_repository.dart';

import '../init_mock_hydrated_storage.dart';

class _MockAuthenticationApi extends Mock implements AuthenticationApi {}

class _MockCommentStorage extends Mock implements CommentStorage {}

class _MockFeedApi extends Mock implements FeedApi {}

class _MockPostApi extends Mock implements PostApi {}

class _MockThreadApi extends Mock implements ThreadApi {}

class _MockAnalyticsRepository extends Mock implements AnalyticsRepository {}

class _MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {
  @override
  AuthenticationState get state => AuthenticationStatePlaceholder();

  @override
  Stream<AuthenticationState> get stream => Stream.empty();
}

class _MockReplyRepository extends Mock implements ReplyRepository {}

class _MockVersionRepository extends Mock implements VersionRepository {
  @override
  Future<Version> currentVersion() async => Version(1, 0, 0);
}

class _MockVoteRepository extends Mock implements VoteRepository {
  @override
  VoteState get state => VoteInitial();

  @override
  Stream<VoteState> get stream => Stream.empty();
}

void main() {
  initMockHydratedStorage();

  group(App, () {
    late AuthenticationApi authenticationApi;
    late CommentStorage commentStorage;
    late FeedApi feedApi;
    late PostApi postApi;
    late ThreadApi threadApi;
    late AnalyticsRepository analyticsRepository;
    late AuthenticationRepository authenticationRepository;
    late ReplyRepository replyRepository;
    late VersionRepository versionRepository;
    late VisitedPostRepository visitedPostRepository;
    late VoteRepository voteRepository;

    setUp(() {
      authenticationApi = _MockAuthenticationApi();
      commentStorage = _MockCommentStorage();
      feedApi = _MockFeedApi();
      postApi = _MockPostApi();
      threadApi = _MockThreadApi();
      analyticsRepository = _MockAnalyticsRepository();
      authenticationRepository = _MockAuthenticationRepository();
      replyRepository = _MockReplyRepository();
      voteRepository = _MockVoteRepository();
      visitedPostRepository = VisitedPostRepository();
      versionRepository = _MockVersionRepository();
    });

    Widget buildSubject() {
      return App(
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
      );
    }

    BuildContext childContext(WidgetTester tester) {
      return tester.element(find.byType(AppView));
    }

    testWidgets('provides $AuthenticationApi', (tester) async {
      await tester.pumpWidget(buildSubject());
      final context = childContext(tester);
      expect(context.read<AuthenticationApi>(), isNotNull);
    });

    testWidgets('provides $CommentStorage', (tester) async {
      await tester.pumpWidget(buildSubject());
      final context = childContext(tester);
      expect(context.read<CommentStorage>(), isNotNull);
    });

    testWidgets('provides $FeedApi', (tester) async {
      await tester.pumpWidget(buildSubject());
      final context = childContext(tester);
      expect(context.read<FeedApi>(), isNotNull);
    });

    testWidgets('provides $PostApi', (tester) async {
      await tester.pumpWidget(buildSubject());
      final context = childContext(tester);
      expect(context.read<PostApi>(), isNotNull);
    });

    testWidgets('provides $ThreadApi', (tester) async {
      await tester.pumpWidget(buildSubject());
      final context = childContext(tester);
      expect(context.read<ThreadApi>(), isNotNull);
    });

    testWidgets('provides $AnalyticsRepository', (tester) async {
      await tester.pumpWidget(buildSubject());
      final context = childContext(tester);
      expect(context.read<AnalyticsRepository>(), isNotNull);
    });

    testWidgets('provides $AuthenticationRepository', (tester) async {
      await tester.pumpWidget(buildSubject());
      final context = childContext(tester);
      expect(context.read<AuthenticationRepository>(), isNotNull);
    });

    testWidgets('provides $ReplyRepository', (tester) async {
      await tester.pumpWidget(buildSubject());
      final context = childContext(tester);
      expect(context.read<ReplyRepository>(), isNotNull);
    });

    testWidgets('provides $VersionRepository', (tester) async {
      await tester.pumpWidget(buildSubject());
      final context = childContext(tester);
      expect(context.read<VersionRepository>(), isNotNull);
    });

    testWidgets('provides $VisitedPostRepository', (tester) async {
      await tester.pumpWidget(buildSubject());
      final context = childContext(tester);
      expect(context.read<VisitedPostRepository>(), isNotNull);
    });

    testWidgets('provides $VoteRepository', (tester) async {
      await tester.pumpWidget(buildSubject());
      final context = childContext(tester);
      expect(context.read<VoteRepository>(), isNotNull);
    });

    testWidgets('provides $AppBloc', (tester) async {
      await tester.pumpWidget(buildSubject());
      final context = childContext(tester);
      expect(context.read<AppBloc>(), isNotNull);
    });

    testWidgets('provides $AppRouter', (tester) async {
      await tester.pumpWidget(buildSubject());
      final context = childContext(tester);
      expect(context.read<AppRouter>(), isNotNull);
    });

    testWidgets('provides $AuthenticationBloc', (tester) async {
      await tester.pumpWidget(buildSubject());
      final context = childContext(tester);
      expect(context.read<AuthenticationBloc>(), isNotNull);
    });

    testWidgets('provides $ThemeBloc', (tester) async {
      await tester.pumpWidget(buildSubject());
      final context = childContext(tester);
      expect(context.read<ThemeBloc>(), isNotNull);
    });

    testWidgets('provides $VersionBloc', (tester) async {
      await tester.pumpWidget(buildSubject());
      final context = childContext(tester);
      expect(context.read<VersionBloc>(), isNotNull);
    });

    testWidgets('provides $VoteFailureBloc', (tester) async {
      await tester.pumpWidget(buildSubject());
      final context = childContext(tester);
      expect(context.read<VoteFailureBloc>(), isNotNull);
    });

    testWidgets('renders $AppView', (tester) async {
      await tester.pumpWidget(buildSubject());
      expect(find.byType(AppView), findsOneWidget);
    });
  });
}
