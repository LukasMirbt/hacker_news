// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../helpers/pump_app.dart';

class _MockAppPostHeaderData extends Mock implements AppPostHeaderData {}

void main() {
  group(PostHeaderCommentButton, () {
    late AppPostHeaderData data;

    setUp(() {
      data = _MockAppPostHeaderData();
    });

    Widget buildSubject() {
      return Provider.value(
        value: data,
        child: PostHeaderCommentButton(),
      );
    }

    testWidgets('renders $PostHeaderButtonPlaceholder '
        'when data is null', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.byType(PostHeaderButtonPlaceholder),
        findsOneWidget,
      );
    });

    testWidgets('renders commentButton when non-null', (tester) async {
      final commentButton = Container();
      when(() => data.commentButton).thenReturn(commentButton);
      await tester.pumpApp(buildSubject());
      expect(find.byWidget(commentButton), findsOneWidget);
    });
  });
}
