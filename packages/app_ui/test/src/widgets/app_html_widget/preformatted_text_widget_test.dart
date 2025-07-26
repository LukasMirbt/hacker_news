import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:html/dom.dart' as dom;
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class _MockElement extends Mock implements dom.Element {}

void main() {
  const text = 'text';

  group(PreformattedTextWidget, () {
    late dom.Element element;

    setUp(() {
      element = _MockElement();
      when(() => element.text).thenReturn(text);
    });

    Widget buildSubject() {
      return PreformattedTextWidget(
        element: element,
      );
    }

    testWidgets('renders correct text', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.text(text), findsOneWidget);
    });

    testWidgets('has correct style', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = tester.widget<Text>(
        find.byType(Text),
      );
      expect(
        widget.style?.fontFamily,
        FontFamily.notoSansMono,
      );
    });
  });
}
