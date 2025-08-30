// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(AppTheme, () {
    group('themeData', () {
      group('iconTheme', () {
        test('values are correct in light mode', () {
          final theme = LightTheme();
          final colors = theme.colors;
          final data = theme.themeData;
          final iconTheme = data.iconTheme;
          expect(
            iconTheme,
            IconThemeData(
              color: colors.onSurface,
              size: 24,
              opticalSize: 24,
              fill: 0,
              grade: 0,
            ),
          );
        });

        test('values are correct in dark mode', () {
          final theme = DarkTheme();
          final colors = theme.colors;
          final data = theme.themeData;
          final iconTheme = data.iconTheme;
          expect(
            iconTheme,
            IconThemeData(
              color: colors.onSurface,
              size: 24,
              opticalSize: 24,
              fill: 0,
              grade: -25,
            ),
          );
        });
      });
    });
  });
}
