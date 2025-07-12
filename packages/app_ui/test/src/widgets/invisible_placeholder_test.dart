import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/helpers.dart';

void main() {
  final child = Container();

  group(InvisiblePlaceholder, () {
    InvisiblePlaceholder buildSubject({bool? visible}) {
      return InvisiblePlaceholder(
        visible: visible ?? true,
        child: child,
      );
    }

    group(Visibility, () {
      Visibility findWidget(WidgetTester tester) {
        return tester.widget<Visibility>(
          find.byType(Visibility),
        );
      }

      testWidgets('maintainSize is true', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.maintainSize, true);
      });

      testWidgets('maintainState is true', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.maintainState, true);
      });

      testWidgets('maintainAnimation is true', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.maintainAnimation, true);
      });

      testWidgets('visible is true when visible', (tester) async {
        const visible = true;
        await tester.pumpApp(
          buildSubject(visible: visible),
        );
        final widget = findWidget(tester);
        expect(widget.visible, visible);
      });

      testWidgets('visible is false when !visible', (tester) async {
        const visible = false;
        await tester.pumpApp(
          buildSubject(visible: visible),
        );
        final widget = findWidget(tester);
        expect(widget.visible, visible);
      });
    });
  });
}
