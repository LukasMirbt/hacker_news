// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/content_settings/content_settings.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockContentSettingsBloc
    extends MockBloc<ContentSettingsEvent, ContentSettingsState>
    implements ContentSettingsBloc {}

void main() {
  final initialState = ContentSettingsState(
    linkLaunchMode: LinkLaunchMode.inAppBrowserView,
  );

  group(ContentSettingsBody, () {
    late ContentSettingsBloc bloc;

    setUp(() {
      bloc = _MockContentSettingsBloc();
      when(() => bloc.state).thenReturn(initialState);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ContentSettingsBody(),
      );
    }

    testWidgets('renders $LinkLaunchModeRadioGroup', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(LinkLaunchModeRadioGroup), findsOneWidget);
    });

    testWidgets('renders $AppSectionHeader', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AppSectionHeader), findsOneWidget);
    });
  });
}
