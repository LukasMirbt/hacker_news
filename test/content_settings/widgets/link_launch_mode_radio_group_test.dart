// ignore_for_file: prefer_const_constructors

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

class _MockContentSettingsState extends Mock implements ContentSettingsState {}

void main() {
  const groupValue = LinkLaunchMode.inAppBrowserView;

  group(LinkLaunchModeRadioGroup, () {
    late ContentSettingsBloc bloc;
    late ContentSettingsState state;

    setUp(() {
      bloc = _MockContentSettingsBloc();
      state = _MockContentSettingsState();
      when(() => bloc.state).thenReturn(state);
      when(() => state.linkLaunchMode).thenReturn(groupValue);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: LinkLaunchModeRadioGroup(),
      );
    }

    group(RadioGroup<LinkLaunchMode>, () {
      RadioGroup<LinkLaunchMode> findWidget(WidgetTester tester) {
        return tester.widget<RadioGroup<LinkLaunchMode>>(
          find.byType(RadioGroup<LinkLaunchMode>),
        );
      }

      testWidgets('has correct groupValue', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.groupValue, groupValue);
      });

      testWidgets('adds $ContentSettingsLinkLaunchModeChanged '
          'onChanged', (tester) async {
        const value = LinkLaunchMode.externalApplication;
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.onChanged(value);
        verify(
          () => bloc.add(
            ContentSettingsLinkLaunchModeChanged(value),
          ),
        ).called(1);
      });

      testWidgets(
        'renders $LinkLaunchModeRadioOption for each $LinkLaunchMode',
        (tester) async {
          await tester.pumpApp(buildSubject());
          for (final (index, mode) in LinkLaunchMode.values.indexed) {
            final option = tester.widget<LinkLaunchModeRadioOption>(
              find.byType(LinkLaunchModeRadioOption).at(index),
            );
            expect(option.value, mode);
          }
        },
      );
    });
  });
}
