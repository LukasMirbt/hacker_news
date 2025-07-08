// ignore_for_file: prefer_const_constructors

import 'package:feed_repository/feed_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(PaginatedFeedPlaceholder, () {
    test('returns $PaginatedFeed', () {
      expect(
        PaginatedFeedPlaceholder(),
        isA<PaginatedFeed>(),
      );
    });
  });
}
