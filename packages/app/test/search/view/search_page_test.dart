// ignore_for_file: prefer_const_constructors

import 'package:app/app_web_view/app_web_view.dart';
import 'package:app/search/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

    BuildContext findContext(WidgetTester tester) {
      return tester.element(
        find.byType(SearchView),
      );
    }

    testWidgets('provides $SearchBloc', (tester) async {
      await tester.pumpApp(buildSubject());
      final context = findContext(tester);
      expect(context.read<SearchBloc>(), isNotNull);
    });

    testWidgets('provides $AppWebViewBloc '
        'with $SearchWebViewConfiguration', (tester) async {
      await tester.pumpApp(buildSubject());
      final context = findContext(tester);
      final bloc = context.read<AppWebViewBloc>();
      expect(
        bloc.state.configuration,
        isA<SearchWebViewConfiguration>(),
      );
    });

    testWidgets('renders $SearchView', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(SearchView), findsOneWidget);
    });
  });
}
