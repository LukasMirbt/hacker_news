// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:thread_repository/thread_repository.dart';

void main() {
  group(ThreadFeedItemPlaceholder, () {
    test('returns $ThreadFeedItem', () {
      expect(
        ThreadFeedItemPlaceholder(),
        isA<ThreadFeedItem>(),
      );
    });
  });
}
