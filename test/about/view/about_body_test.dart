// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/about/about.dart';

import '../../app/pump_app.dart';

class _MockAboutBloc extends MockBloc<AboutEvent, void> implements AboutBloc {}

void main() {
  group(AboutBody, () {
    late AboutBloc bloc;

    setUp(() {
      bloc = _MockAboutBloc();
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: AboutBody(),
      );
    }

    testWidgets('renders $LicenseListItem', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(LicenseListItem), findsOneWidget);
    });

    testWidgets('renders $PrivacyPolicyListItem', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(PrivacyPolicyListItem), findsOneWidget);
    });

    testWidgets('renders $VersionListItem', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(VersionListItem), findsOneWidget);
    });
  });
}
