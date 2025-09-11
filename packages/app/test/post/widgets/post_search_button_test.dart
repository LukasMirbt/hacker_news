// ignore_for_file: prefer_const_constructors

import 'package:app/app_router/app_router.dart';
import 'package:app/post/post.dart';
import 'package:app/post_search/post_search.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockAppRouter extends Mock implements AppRouter {}

void main() {
  group(PostSearchButton, () {
    late AppRouter router;

    setUp(() {
      router = _MockAppRouter();
    });

    Widget buildSubject() {
      return Provider.value(
        value: router,
        child: PostSearchButton(),
      );
    }

    group(IconButton, () {
      IconButton findWidget(WidgetTester tester) {
        return tester.widget<IconButton>(
          find.byType(IconButton),
        );
      }

      testWidgets('has correct icon', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.icon,
          isA<AppIcon>().having(
            (icon) => icon.icon,
            'icon',
            Symbols.search_rounded,
          ),
        );
      });

      testWidgets('navigates to $PostSearchRoute onPressed', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.onPressed?.call();
        verify(
          () => router.goRelative(
            PostSearchRoute(),
          ),
        ).called(1);
      });
    });
  });
}
