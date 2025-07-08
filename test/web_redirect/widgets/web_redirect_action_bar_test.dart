// ignore_for_file: prefer_const_constructors

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';
import '../mock_in_app_web_view_platform.dart';

class _MockWebRedirectBloc extends MockBloc<WebRedirectEvent, WebRedirectState>
    implements WebRedirectBloc {}

void main() {
  group(WebRedirectActionBar, () {
    late WebRedirectBloc bloc;

    setUp(() {
      bloc = _MockWebRedirectBloc();
      when(() => bloc.state).thenReturn(
        WebRedirectState.from(
          WebRedirectPlaceholder(),
        ),
      );
      when(() => bloc.stream).thenAnswer((_) => Stream.value(bloc.state));
      InAppWebViewPlatform.instance = MockInAppWebViewPlatform();
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: WebRedirectActionBar(),
      );
    }

    testWidgets('renders $WebRedirectBackButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(WebRedirectBackButton), findsOneWidget);
    });

    testWidgets('renders $WebRedirectForwardButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(WebRedirectForwardButton), findsOneWidget);
    });

    testWidgets('renders $WebRedirectReloadButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(WebRedirectReloadButton), findsOneWidget);
    });

    testWidgets('renders $WebRedirectCloseButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(WebRedirectCloseButton), findsOneWidget);
    });
  });
}
