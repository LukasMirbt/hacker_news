// ignore_for_file: prefer_const_constructors

import 'package:app/app_web_view/app_web_view.dart';
import 'package:app/web_redirect/web_redirect.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';
import '../../app_web_view/mock_in_app_web_view_platform.dart';

class _MockAppWebViewBloc extends MockBloc<AppWebViewEvent, AppWebViewState>
    implements AppWebViewBloc {}

void main() {
  group(WebRedirectBody, () {
    late AppWebViewBloc bloc;

    setUp(() {
      bloc = _MockAppWebViewBloc();
      when(() => bloc.state).thenReturn(
        AppWebViewState.from(
          WebRedirectWebViewConfiguration(
            url: Uri(),
            html: null,
          ),
        ),
      );
      when(() => bloc.stream).thenAnswer((_) => Stream.value(bloc.state));
      InAppWebViewPlatform.instance = MockInAppWebViewPlatform();
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: WebRedirectBody(),
      );
    }

    testWidgets('renders $AppWebView', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AppWebView), findsOneWidget);
    });

    testWidgets('renders $AppWebViewProgressIndicator', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AppWebViewProgressIndicator), findsOneWidget);
    });
  });
}
