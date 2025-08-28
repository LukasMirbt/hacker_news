// ignore_for_file: prefer_const_constructors

import 'package:app/search/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';
import '../../app_web_view/mock_in_app_web_view_platform.dart';

class _MockSearchNavigationModel extends Mock
    implements SearchNavigationModel {}

void main() {
  final initialUrl = Uri.parse('https://www.example.com');

  group(SearchPage, () {
    late SearchNavigationModel navigationModel;

    setUp(() {
      navigationModel = _MockSearchNavigationModel();
      when(() => navigationModel.initialUrl).thenReturn(initialUrl);
      InAppWebViewPlatform.instance = MockInAppWebViewPlatform();
    });

    Widget buildSubject() {
      return SearchPage(
        navigationModel: navigationModel,
      );
    }

    testWidgets('renders $SearchWebViewBlocProvider', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(SearchWebViewBlocProvider), findsOneWidget);
    });

    testWidgets('renders $SearchView', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(SearchView), findsOneWidget);
    });
  });
}
