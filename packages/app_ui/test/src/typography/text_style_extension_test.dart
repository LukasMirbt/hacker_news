// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TextStyleExtension', () {
    group('copyWithWeight', () {
      test('returns correct $TextStyle', () {
        final style = TextStyle(
          fontVariations: [
            FontVariation.weight(400),
            FontVariation.opticalSize(16),
          ],
        );
        expect(
          style.copyWithWeight(
            (weight) => weight * 0.9,
          ),
          TextStyle(
            fontVariations: [
              FontVariation.weight(360),
              FontVariation.opticalSize(16),
            ],
          ),
        );
      });
    });
  });
}
