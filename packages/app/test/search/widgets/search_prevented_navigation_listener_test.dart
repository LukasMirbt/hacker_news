// ignore_for_file: prefer_const_constructors

import 'package:app/app_router/app_router.dart';
import 'package:app/app_web_view/app_web_view.dart';
import 'package:app/post/post.dart';
import 'package:app/search/search.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:web_links/web_links.dart';

import '../../app/pump_app.dart';

class _MockSearchBloc extends MockBloc<SearchEvent, void>
    implements SearchBloc {}

class _MockAppWebViewBloc extends MockBloc<AppWebViewEvent, AppWebViewState>
    implements AppWebViewBloc {}

class _MockAppRouter extends Mock implements AppRouter {}

class _MockWebLinks extends Mock implements WebLinks {}

void main() {
  final child = Container();

  final initialState = AppWebViewState.from(
    SearchWebViewConfiguration(),
  );

  group(SearchPreventedNavigationListener, () {
    late SearchBloc searchBloc;
    late AppWebViewBloc appWebViewBloc;
    late AppRouter router;
    late WebLinks links;

    setUp(() {
      searchBloc = _MockSearchBloc();
      appWebViewBloc = _MockAppWebViewBloc();
      router = _MockAppRouter();
      links = _MockWebLinks();
      when(() => appWebViewBloc.state).thenReturn(initialState);
    });

    Widget buildSubject() {
      return Provider.value(
        value: router,
        child: BlocProvider.value(
          value: searchBloc,
          child: BlocProvider.value(
            value: appWebViewBloc,
            child: SearchPreventedNavigationListener(
              links: links,
              child: child,
            ),
          ),
        ),
      );
    }

    testWidgets('adds $SearchExternalLinkPressed '
        'when !isPost', (tester) async {
      final url = Uri.parse('http://example.com');
      when(() => links.isPost(url)).thenReturn(false);
      whenListen(
        appWebViewBloc,
        initialState: initialState,
        Stream.value(
          initialState.copyWith(
            preventedNavigation: PreventedNavigation(url),
          ),
        ),
      );
      await tester.pumpApp(buildSubject());
      verify(
        () => searchBloc.add(
          SearchExternalLinkPressed(url),
        ),
      ).called(1);
    });

    testWidgets('navigates to $PostRoute when isPost', (tester) async {
      const postId = 'postId';
      final url = Uri.parse('http://example.com/post?id=$postId');
      when(() => links.isPost(url)).thenReturn(true);
      whenListen(
        appWebViewBloc,
        initialState: initialState,
        Stream.value(
          initialState.copyWith(
            preventedNavigation: PreventedNavigation(url),
          ),
        ),
      );
      await tester.pumpApp(buildSubject());
      verify(
        () => router.goRelative(
          PostRoute(postId: postId),
        ),
      ).called(1);
    });

    testWidgets('renders child', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byWidget(child), findsOneWidget);
    });
  });
}
