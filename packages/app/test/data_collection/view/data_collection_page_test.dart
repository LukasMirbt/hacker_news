// ignore_for_file: prefer_const_constructors

import 'package:app/data_collection/data_collection.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../app/pump_app.dart';

void main() {
  group(DataCollectionPage, () {
    Widget buildSubject() => DataCollectionPage();

    testWidgets('renders $DataCollectionView', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(DataCollectionView), findsOneWidget);
    });
  });
}
