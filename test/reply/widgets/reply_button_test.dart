// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply/reply.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockReplyBloc extends MockBloc<ReplyEvent, ReplyState>
    implements ReplyBloc {}

class _MockReplyState extends Mock implements ReplyState {}

void main() {
  group(ReplyButton, () {
    late ReplyBloc bloc;
    late ReplyState state;

    setUp(() {
      bloc = _MockReplyBloc();
      state = _MockReplyState();
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

      testWidgets('adds $ReplySubmitted onPressed', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.onPressed?.call();
        verify(() => bloc.add(ReplySubmitted()));
      });
    });
  });
}
