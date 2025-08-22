// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:app/l10n/l10n.dart';
import 'package:app/reply/reply.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_repository/reply_repository.dart';

import '../../app/pump_app.dart';

class _MockReplyBloc extends MockBloc<ReplyEvent, ReplyState>
    implements ReplyBloc {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));
  const text = 'text';

  final initialState = ReplyState(
    url: 'url',
    parent: OtherUserReplyParentModel(
      parent: OtherUserReplyParentPlaceholder(),
    ),
    form: ReplyFormModel(
      text: text,
      form: ReplyFormPlaceholder(),
    ),
  );

  group(ReplyTextField, () {
    late ReplyBloc bloc;

    setUp(() {
      bloc = _MockReplyBloc();
      when(() => bloc.state).thenReturn(initialState);
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

      testWidgets('initial text is form.text', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.controller?.text, text);
      });

      testWidgets('updates controller when form.text changes '
          'to a different value than controller.text', (tester) async {
        const updatedText = 'updatedText';
        whenListen(
          bloc,
          initialState: initialState,
          Stream.value(
            initialState.copyWith(
              form: initialState.form.copyWith(
                text: updatedText,
              ),
            ),
          ),
        );
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.controller?.text,
          updatedText,
        );
      });

      testWidgets('does not update controller when form.text changes '
          'to the same value as controller.text', (tester) async {
        final completer = Completer<ReplyState>();

        const updatedText = 'updatedText';

        final selection = TextSelection.fromPosition(
          TextPosition(offset: 0),
        );

        whenListen(
          bloc,
          Stream.fromFuture(completer.future),
          initialState: initialState,
        );

        await tester.pumpApp(buildSubject());

        final widget = findWidget(tester);

        final controller = widget.controller!
          ..text = updatedText
          ..selection = selection;

        completer.complete(
          initialState.copyWith(
            form: initialState.form.copyWith(
              text: updatedText,
            ),
          ),
        );

        await tester.pump();

        expect(
          controller.selection,
          selection,
        );
      });

      testWidgets('autofocus is true', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.autofocus, true);
      });

      testWidgets('expands is true', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.expands, true);
      });

      testWidgets('maxLines is null', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.maxLines, null);
      });

      testWidgets('has correct decoration', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.decoration,
          InputDecoration.collapsed(
            hintText: l10n.reply_textFieldHintText,
          ),
        );
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
