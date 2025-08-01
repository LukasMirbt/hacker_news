// ignore_for_file: prefer_function_declarations_over_variables

import 'package:bloc_test/bloc_test.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/feed/feed.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockLinkLauncher extends Mock implements LinkLauncher {}

class _MockAppRouter extends Mock implements AppRouter {}

class _MockFeedBloc extends MockBloc<FeedEvent, FeedState>
    implements FeedBloc {}

void main() {
  final child = Container();

  final initialState = FeedState.initial(
    type: FeedType.top,
    visitedPosts: {},
  );

  group(FeedItemPressListener, () {
    late FeedBloc bloc;
    late LinkLauncher linkLauncher;
    late AppRouter router;

    setUp(() {
      bloc = _MockFeedBloc();
      linkLauncher = _MockLinkLauncher();
      router = _MockAppRouter();
      when(() => bloc.state).thenReturn(initialState);
    });

    Widget buildSubject() {
      return Provider.value(
        value: router,
        child: BlocProvider.value(
          value: bloc,
          child: FeedItemPressListener(
            linkLauncher: linkLauncher,
            child: child,
          ),
        ),
      );
    }

    testWidgets('calls launch when urlHost is non-null', (tester) async {
      final itemPress = ItemPress(
        id: 'id',
        urlHost: 'urlHost',
        url: 'url',
      );
      final launch = () => linkLauncher.launch(itemPress.url);
      when(launch).thenAnswer((_) async {});
      whenListen(
        bloc,
        initialState: initialState,
        Stream.value(
          initialState.copyWith(
            itemPress: itemPress,
          ),
        ),
      );
      await tester.pumpApp(buildSubject());
      verify(launch).called(1);
    });

    testWidgets('navigates to $PostRoute when urlHost is null', (tester) async {
      final itemPress = ItemPress(
        id: 'id',
        urlHost: null,
        url: '',
      );
      whenListen(
        bloc,
        initialState: initialState,
        Stream.value(
          initialState.copyWith(
            itemPress: itemPress,
          ),
        ),
      );
      await tester.pumpApp(buildSubject());
      verify(
        () => router.goRelative(
          PostRoute(postId: itemPress.id),
        ),
      ).called(1);
    });

    testWidgets('renders child', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byWidget(child), findsOneWidget);
    });
  });
}
