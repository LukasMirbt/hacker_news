// ignore_for_file: prefer_const_constructors

import 'package:app/search/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../app/pump_app.dart';

void main() {
  group(SearchPage, () {
    Widget buildSubject() => SearchPage();

    testWidgets('renders $Placeholder', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(Placeholder), findsOneWidget);
    });
  });
}
