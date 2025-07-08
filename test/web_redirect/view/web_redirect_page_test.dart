// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';

import '../../app/pump_app.dart';
import '../mock_in_app_web_view_platform.dart';

void main() {
  group(WebRedirectPage, () {
    setUp(() {
      InAppWebViewPlatform.instance = MockInAppWebViewPlatform();
    });

    Widget buildSubject() {
      return WebRedirectPage(
        url: 'http://example.com',
      );
    }

    testWidgets('renders $WebRedirectView', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(WebRedirectView), findsOneWidget);
    });
  });
}
