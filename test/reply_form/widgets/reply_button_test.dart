// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply_form/reply_form.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockReplyFormBloc extends MockBloc<ReplyFormEvent, ReplyFormState>
    implements ReplyFormBloc {}

class _MockReplyFormState extends Mock implements ReplyFormState {}

void main() {
  group(ReplyButton, () {
    late ReplyFormBloc bloc;
    late ReplyFormState state;

    setUp(() {
      bloc = _MockReplyFormBloc();
      state = _MockReplyFormState();
      when(() => bloc.state).thenReturn(state);
      when(() => state.isSubmissionLoading).thenReturn(false);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ReplyButton(),
      );
    }

    group(AppFilledButton, () {
      AppFilledButton findWidget(WidgetTester tester) {
        return tester.widget<AppFilledButton>(
          find.byType(AppFilledButton),
        );
      }

      group('isLoading', () {
        testWidgets('is true when state.isSubmissionLoading', (tester) async {
          when(() => state.isSubmissionLoading).thenReturn(true);
          await tester.pumpApp(buildSubject());
          final widget = findWidget(tester);
          expect(widget.isLoading, true);
        });

        testWidgets('is false when !state.isSubmissionLoading', (tester) async {
          await tester.pumpApp(buildSubject());
          final widget = findWidget(tester);
          expect(widget.isLoading, false);
        });
      });

      testWidgets('adds $ReplyFormSubmitted onPressed', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.onPressed?.call();
        verify(() => bloc.add(ReplyFormSubmitted()));
      });
    });
  });
}
