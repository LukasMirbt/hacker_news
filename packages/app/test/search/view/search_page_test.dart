// ignore_for_file: prefer_const_constructors

import 'package:app/search/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../app/pump_app.dart';
import '../../app_web_view/mock_in_app_web_view_platform.dart';

void main() {
  group(SearchPage, () {
    setUp(() {
      InAppWebViewPlatform.instance = MockInAppWebViewPlatform();
    });

    Widget buildSubject() => SearchPage();

    testWidgets('renders $SearchView', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(SearchView), findsOneWidget);
    });
  });
}
