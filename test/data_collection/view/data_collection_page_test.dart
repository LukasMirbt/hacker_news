// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/data_collection/data_collection.dart';

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
