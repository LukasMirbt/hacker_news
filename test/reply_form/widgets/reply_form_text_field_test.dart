// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply_form/reply_form.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockReplyFormBloc extends MockBloc<ReplyFormEvent, ReplyFormState>
    implements ReplyFormBloc {}

void main() {
  group(ReplyFormTextField, () {
    late ReplyFormBloc bloc;

    setUp(() {
      bloc = _MockReplyFormBloc();
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ReplyFormTextField(),
      );
    }

    group(TextField, () {
      TextField findWidget(WidgetTester tester) {
        return tester.widget<TextField>(
          find.byType(TextField),
        );
      }

      testWidgets('has correct minLines', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.minLines, 5);
      });

      testWidgets('has correct maxLines', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.maxLines, null);
      });

      testWidgets('adds $ReplyFormTextChanged onChanged', (tester) async {
        const text = 'text';
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.onChanged?.call(text);
        verify(
          () => bloc.add(
            ReplyFormTextChanged(text),
          ),
        ).called(1);
      });
    });
  });
}
