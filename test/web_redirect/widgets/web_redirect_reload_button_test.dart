// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockWebRedirectBloc extends MockBloc<WebRedirectEvent, WebRedirectState>
    implements WebRedirectBloc {}

void main() {
  group(WebRedirectReloadButton, () {
    late WebRedirectBloc bloc;

    setUp(() {
      bloc = _MockWebRedirectBloc();
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: WebRedirectReloadButton(),
      );
    }

    testWidgets('renders $IconButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('adds $WebRedirectReloadPressed when $IconButton '
        'is pressed', (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(IconButton));
      verify(() => bloc.add(WebRedirectReloadPressed())).called(1);
    });
  });
}
