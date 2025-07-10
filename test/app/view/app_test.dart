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
import 'package:post_api/post_api.dart';
import 'package:version_repository/version_repository.dart';
import 'package:vote_repository/vote_repository.dart';

import '../init_mock_hydrated_storage.dart';

class _MockAuthenticationApi extends Mock implements AuthenticationApi {}

class _MockFeedApi extends Mock implements FeedApi {}

class _MockPostApi extends Mock implements PostApi {}

class _MockAnalyticsRepository extends Mock implements AnalyticsRepository {}

class _MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {
  @override
  AuthenticationState get state => AuthenticationState();

  @override
  Stream<AuthenticationState> get stream => Stream.empty();
}

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
    late FeedApi feedApi;
    late PostApi postApi;
    late AnalyticsRepository analyticsRepository;
    late AuthenticationRepository authenticationRepository;
    late VersionRepository versionRepository;
    late VoteRepository voteRepository;

    setUp(() {
      authenticationApi = _MockAuthenticationApi();
      feedApi = _MockFeedApi();
      postApi = _MockPostApi();
      analyticsRepository = _MockAnalyticsRepository();
      authenticationRepository = _MockAuthenticationRepository();
      voteRepository = _MockVoteRepository();
      versionRepository = _MockVersionRepository();
    });

    Widget buildSubject() {
      return App(
        authenticationApi: authenticationApi,
        feedApi: feedApi,
        analyticsRepository: analyticsRepository,
        authenticationRepository: authenticationRepository,
        postApi: postApi,
        versionRepository: versionRepository,
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

    testWidgets('provides $PostApi', (tester) async {
      await tester.pumpWidget(buildSubject());
      final context = childContext(tester);
      expect(context.read<PostApi>(), isNotNull);
    });

    testWidgets('provides $FeedApi', (tester) async {
      await tester.pumpWidget(buildSubject());
      final context = childContext(tester);
      expect(context.read<FeedApi>(), isNotNull);
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

    testWidgets('provides $VersionRepository', (tester) async {
      await tester.pumpWidget(buildSubject());
      final context = childContext(tester);
      expect(context.read<VersionRepository>(), isNotNull);
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

    testWidgets('provides $AppRouterBloc', (tester) async {
      await tester.pumpWidget(buildSubject());
      final context = childContext(tester);
      expect(context.read<AppRouterBloc>(), isNotNull);
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
