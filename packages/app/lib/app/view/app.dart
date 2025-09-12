import 'package:analytics_repository/analytics_repository.dart';
import 'package:app/app/app.dart';
import 'package:app/app_router/app_router.dart';
import 'package:app/authentication/authentication.dart';
import 'package:app/theme/theme.dart';
import 'package:app/version/version.dart';
import 'package:app/vote_failure/vote_failure.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:draft_storage/draft_storage.dart';
import 'package:feed_api/feed_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:post_repository/post_repository.dart';
import 'package:provider/provider.dart';
import 'package:reply_repository/reply_repository.dart';
import 'package:thread_api/thread_api.dart';
import 'package:version_repository/version_repository.dart';
import 'package:visited_post_storage/visited_post_storage.dart';
import 'package:vote_repository/vote_repository.dart';

class App extends StatelessWidget {
  const App({
    required AuthenticationApi authenticationApi,
    required DraftStorage draftStorage,
    required FeedApi feedApi,
    required PostApi postApi,
    required SettingsStorage settingsStorage,
    required ThreadApi threadApi,
    required VisitedPostStorage visitedPostStorage,
    required AnalyticsRepository analyticsRepository,
    required AuthenticationRepository authenticationRepository,
    required LinkLauncher linkLauncher,
    required ReplyRepository replyRepository,
    required VersionRepository versionRepository,
    required VoteRepository voteRepository,
    super.key,
  }) : _authenticationApi = authenticationApi,
       _draftStorage = draftStorage,
       _feedApi = feedApi,
       _postApi = postApi,
       _settingsStorage = settingsStorage,
       _threadApi = threadApi,
       _visitedPostStorage = visitedPostStorage,
       _analyticsRepository = analyticsRepository,
       _authenticationRepository = authenticationRepository,
       _linkLauncher = linkLauncher,
       _replyRepository = replyRepository,
       _versionRepository = versionRepository,
       _voteRepository = voteRepository;

  final AuthenticationApi _authenticationApi;
  final DraftStorage _draftStorage;
  final FeedApi _feedApi;
  final PostApi _postApi;
  final SettingsStorage _settingsStorage;
  final ThreadApi _threadApi;
  final VisitedPostStorage _visitedPostStorage;
  final AnalyticsRepository _analyticsRepository;
  final AuthenticationRepository _authenticationRepository;
  final LinkLauncher _linkLauncher;
  final ReplyRepository _replyRepository;
  final VersionRepository _versionRepository;
  final VoteRepository _voteRepository;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: _authenticationApi),
        Provider.value(value: _draftStorage),
        Provider.value(value: _feedApi),
        Provider.value(value: _postApi),
        Provider.value(value: _settingsStorage),
        Provider.value(value: _threadApi),
        Provider.value(value: _visitedPostStorage),
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(value: _analyticsRepository),
          RepositoryProvider.value(value: _authenticationRepository),
          RepositoryProvider.value(value: _linkLauncher),
          RepositoryProvider.value(value: _replyRepository),
          RepositoryProvider.value(value: _versionRepository),
          RepositoryProvider.value(value: _voteRepository),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AppBloc(
                settingsStorage: context.read<SettingsStorage>(),
              ),
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
              create: (context) => ThemeBloc(
                settingsStorage: context.read<SettingsStorage>(),
              ),
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
          child: Provider(
            create: (context) => AppRouter(
              appRedirect: const AppRedirect(),
              appRouteList: AppRouteList(),
              loginRedirectModel: LoginRedirectModel(
                authenticationRepository: context
                    .read<AuthenticationRepository>(),
              ),
            ),
            dispose: (_, router) => router.dispose(),
            child: const AppView(),
          ),
        ),
      ),
    );
  }
}
