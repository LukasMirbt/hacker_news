// ignore_for_file: prefer_const_constructors

import 'package:app/app_router/app_router.dart';
import 'package:app/app_web_view/app_web_view.dart';
import 'package:app/post/post.dart';
import 'package:app/search/search.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';
import '../../app_web_view/mock_in_app_web_view_platform.dart';

class _MockSearchBloc extends MockBloc<SearchEvent, void>
    implements SearchBloc {}

class _MockAppRouter extends Mock implements AppRouter {}

class _MockSearchNavigationModel extends Mock
    implements SearchNavigationModel {}

void main() {
  final initialUrl = Uri.parse('https://www.example.com');
  final child = Container();

  group(SearchWebViewBlocProvider, () {
    late SearchBloc searchBloc;
    late AppRouter router;
    late SearchNavigationModel navigationModel;

    setUp(() {
      searchBloc = _MockSearchBloc();
      router = _MockAppRouter();
      navigationModel = _MockSearchNavigationModel();
      when(() => navigationModel.initialUrl).thenReturn(initialUrl);
      InAppWebViewPlatform.instance = MockInAppWebViewPlatform();
    });

    Widget buildSubject() {
      return Provider.value(
        value: router,
        child: BlocProvider.value(
          value: searchBloc,
          child: SearchWebViewBlocProvider(
            navigationModel: navigationModel,
            child: child,
          ),
        ),
      );
    }

    group('onNavigationRequest', () {
      final url = Uri.parse('https://www.example.com/url');

      AppWebViewBloc findBloc(WidgetTester tester) {
        final context = tester.element(
          find.byWidget(child),
        );
        return context.read<AppWebViewBloc>();
      }

      testWidgets('returns ${NavigationDecision.navigate} when navigate '
          'returns ${SearchNavigationDecision.navigate}', (tester) async {
        when(() => navigationModel.navigate(url)).thenReturn(
          SearchNavigationDecision.navigate,
        );
        await tester.pumpApp(buildSubject());
        final bloc = findBloc(tester);
        expect(
          bloc.state.onNavigationRequest?.call(url),
          NavigationDecision.navigate,
        );
      });

      testWidgets('adds $SearchExternalLinkPressed '
          'and returns ${NavigationDecision.prevent} when navigate '
          'returns ${SearchNavigationDecision.externalLink}', (tester) async {
        when(() => navigationModel.navigate(url)).thenReturn(
          SearchNavigationDecision.externalLink,
        );
        await tester.pumpApp(buildSubject());
        final bloc = findBloc(tester);
        expect(
          bloc.state.onNavigationRequest?.call(url),
          NavigationDecision.prevent,
        );
        verify(
          () => searchBloc.add(
            SearchExternalLinkPressed(url),
          ),
        ).called(1);
      });

      testWidgets('returns ${NavigationDecision.navigate} when navigate '
          'returns ${SearchNavigationDecision.post} '
          'and postId is null', (tester) async {
        final url = Uri();
        when(() => navigationModel.navigate(url)).thenReturn(
          SearchNavigationDecision.post,
        );
        await tester.pumpApp(buildSubject());
        final bloc = findBloc(tester);
        expect(
          bloc.state.onNavigationRequest?.call(url),
          NavigationDecision.navigate,
        );
      });

      testWidgets('navigates to $PostRoute '
          'and returns ${NavigationDecision.prevent} when navigate '
          'returns ${SearchNavigationDecision.post} '
          'and postId is non-null', (tester) async {
        const postId = 'postId';
        final url = Uri(
          queryParameters: {'id': postId},
        );
        when(() => navigationModel.navigate(url)).thenReturn(
          SearchNavigationDecision.post,
        );
        await tester.pumpApp(buildSubject());
        final bloc = findBloc(tester);
        expect(
          bloc.state.onNavigationRequest?.call(url),
          NavigationDecision.prevent,
        );
        verify(
          () => router.goRelative(
            PostRoute(postId: postId),
          ),
        ).called(1);
      });
    });

    testWidgets('renders child', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byWidget(child), findsOneWidget);
    });
  });
}
