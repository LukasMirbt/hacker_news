import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension AppTester on WidgetTester {
  Future<void> pumpApp(Widget widgetUnderTest) async {
    await pumpWidget(
      MaterialApp(
        theme: const LightTheme().themeData,
        localizationsDelegates: AppUiLocalizations.localizationsDelegates,
        supportedLocales: AppUiLocalizations.supportedLocales,
        home: Scaffold(
          body: widgetUnderTest,
        ),
      ),
    );
  }
}
