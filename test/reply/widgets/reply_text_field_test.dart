// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply/reply.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockReplyBloc extends MockBloc<ReplyEvent, ReplyState>
    implements ReplyBloc {}

void main() {
  group(ReplyTextField, () {
    late ReplyBloc bloc;

    setUp(() {
      bloc = _MockReplyBloc();
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ReplyTextField(),
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

      testWidgets('adds $ReplyTextChanged onChanged', (tester) async {
        const text = 'text';
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.onChanged?.call(text);
        verify(
          () => bloc.add(
            ReplyTextChanged(text),
          ),
        ).called(1);
      });
    });
  });
}
