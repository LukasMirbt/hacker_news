// ignore_for_file: prefer_const_constructors

import 'package:app/reply/reply.dart';
import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockReplyBloc extends MockBloc<ReplyEvent, ReplyState>
    implements ReplyBloc {}

class _MockReplyState extends Mock implements ReplyState {}

class _MockReplyFormModel extends Mock implements ReplyFormModel {}

void main() {
  group(ReplySubmitButton, () {
    late ReplyBloc bloc;
    late ReplyState state;
    late ReplyFormModel form;

    setUp(() {
      bloc = _MockReplyBloc();
      state = _MockReplyState();
      form = _MockReplyFormModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.form).thenReturn(form);
      when(() => form.isSubmissionLoading).thenReturn(false);
      when(() => form.isValid).thenReturn(false);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ReplySubmitButton(),
      );
    }

    group(AppFilledButton, () {
      AppFilledButton findWidget(WidgetTester tester) {
        return tester.widget<AppFilledButton>(
          find.byType(AppFilledButton),
        );
      }

      group('isLoading', () {
        testWidgets('is true when form.isSubmissionLoading', (tester) async {
          when(() => form.isSubmissionLoading).thenReturn(true);
          await tester.pumpApp(buildSubject());
          final widget = findWidget(tester);
          expect(widget.isLoading, true);
        });

        testWidgets('is false when !form.isSubmissionLoading', (tester) async {
          await tester.pumpApp(buildSubject());
          final widget = findWidget(tester);
          expect(widget.isLoading, false);
        });
      });

      group('onPressed', () {
        testWidgets('adds $ReplySubmitted when isValid', (tester) async {
          when(() => form.isValid).thenReturn(true);
          await tester.pumpApp(buildSubject());
          final widget = findWidget(tester);
          widget.onPressed?.call();
          verify(() => bloc.add(ReplySubmitted())).called(1);
        });

        testWidgets('does not add $ReplySubmitted '
            'when !isValid', (tester) async {
          await tester.pumpApp(buildSubject());
          final widget = findWidget(tester);
          widget.onPressed?.call();
          verifyNever(() => bloc.add(ReplySubmitted()));
        });
      });
    });
  });
}
