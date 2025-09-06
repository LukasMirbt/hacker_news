// ignore_for_file: prefer_const_constructors

import 'package:app/l10n/l10n.dart';
import 'package:app/reply/reply.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../app/pump_app.dart';

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(ReplyDisabledExplanation, () {
    Widget buildSubject() => ReplyDisabledExplanation();

    testWidgets('renders correct text', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.text(l10n.reply_disabledExplanationTitle),
        findsOneWidget,
      );
      expect(
        find.text(l10n.reply_disabledExplanationSubtitle),
        findsOneWidget,
      );
    });
  });
}
