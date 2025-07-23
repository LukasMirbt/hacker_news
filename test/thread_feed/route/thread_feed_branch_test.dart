// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart';

void main() {
  group(ThreadFeedBranch, () {
    ThreadFeedBranch createSubject() => ThreadFeedBranch();

    test('is a $StatefulShellBranchData', () {
      final route = createSubject();
      expect(route, isA<StatefulShellBranchData>());
    });

    group('config', () {
      test('has correct type', () {
        expect(
          ThreadFeedBranch.config,
          isA<TypedStatefulShellBranch<ThreadFeedBranch>>(),
        );
      });

      test('has correct routes', () {
        expect(
          ThreadFeedBranch.config.routes,
          [
            ThreadFeedShellRoute.config,
          ],
        );
      });
    });
  });
}
