import 'package:analytics_repository/analytics_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:feed_api/feed_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/app/app.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/authentication/authentication.dart';
import 'package:hacker_client/theme/theme.dart';
import 'package:hacker_client/version/version.dart';
import 'package:hacker_client/vote_failure/vote_failure.dart';
import 'package:post_api/post_api.dart';
import 'package:provider/provider.dart';
import 'package:thread_api/thread_api.dart';
import 'package:version_repository/version_repository.dart';
import 'package:visited_post_repository/visited_post_repository.dart';
import 'package:vote_repository/vote_repository.dart';

class App extends StatelessWidget {
  const App({
    required AuthenticationApi authenticationApi,
    required FeedApi feedApi,
    required PostApi postApi,
    required ThreadApi threadApi,
    required AnalyticsRepository analyticsRepository,
    required AuthenticationRepository authenticationRepository,
    required VersionRepository versionRepository,
    required VisitedPostRepository visitedPostRepository,
    required VoteRepository voteRepository,
    super.key,
  }) : _authenticationApi = authenticationApi,
       _analyticsRepository = analyticsRepository,
       _authenticationRepository = authenticationRepository,
       _feedApi = feedApi,
       _postApi = postApi,
       _threadApi = threadApi,
       _versionRepository = versionRepository,
       _visitedPostRepository = visitedPostRepository,
       _voteRepository = voteRepository;

  final AuthenticationApi _authenticationApi;
  final AnalyticsRepository _analyticsRepository;
  final AuthenticationRepository _authenticationRepository;
  final PostApi _postApi;
  final FeedApi _feedApi;
  final ThreadApi _threadApi;
  final VersionRepository _versionRepository;
  final VisitedPostRepository _visitedPostRepository;
  final VoteRepository _voteRepository;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        RepositoryProvider.value(value: _authenticationApi),
        RepositoryProvider.value(value: _feedApi),
        RepositoryProvider.value(value: _postApi),
        RepositoryProvider.value(value: _threadApi),
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(value: _analyticsRepository),
          RepositoryProvider.value(value: _authenticationRepository),
          RepositoryProvider.value(value: _versionRepository),
          RepositoryProvider.value(value: _visitedPostRepository),
          RepositoryProvider.value(value: _voteRepository),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => AppBloc(),
            ),
            BlocProvider(
              create: (_) => AppRouterBloc(),
            ),
            BlocProvider(
              create: (context) =>
                  AuthenticationBloc(
                    authenticationRepository: context
                        .read<AuthenticationRepository>(),
                  )..add(
                    const AuthenticationSubscriptionRequested(),
                  ),
            ),
            BlocProvider(
              create: (_) => ThemeBloc(),
            ),
            BlocProvider(
              create: (context) =>
                  VersionBloc(
                    versionRepository: context.read<VersionRepository>(),
                  )..add(
                    const VersionStarted(),
                  ),
            ),
            BlocProvider(
              create: (context) =>
                  VoteFailureBloc(
                    voteRepository: context.read<VoteRepository>(),
                  )..add(
                    const VoteFailureSubscriptionRequested(),
                  ),
            ),
          ],
          child: const AppView(),
        ),
      ),
    );
  }
}
