// ignore_for_file: prefer_const_constructors

import 'package:app/profile/profile.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../app/pump_app.dart';
import '../../app_web_view/mock_in_app_web_view_platform.dart';

void main() {
  group(ProfilePage, () {
    setUp(() {
      InAppWebViewPlatform.instance = MockInAppWebViewPlatform();
    });

    Widget buildSubject() {
      return ProfilePage(id: 'id');
    }

    testWidgets('renders $ProfileView', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ProfileView), findsOneWidget);
    });
  });
}
