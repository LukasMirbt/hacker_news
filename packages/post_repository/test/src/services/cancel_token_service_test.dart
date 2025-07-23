// ignore_for_file: cascade_invocations

import 'package:flutter_test/flutter_test.dart';
import 'package:post_repository/post_repository.dart';

void main() {
  group(CancelTokenService, () {
    CancelTokenService createSubject() => CancelTokenService();

    group('generate', () {
      test('calls cancel, creates and returns a new $CancelToken', () {
        final service = createSubject();

        final initialToken = service.generate();
        expect(initialToken.isCancelled, false);

        final newToken = service.generate();
        expect(initialToken.isCancelled, true);
        expect(newToken.isCancelled, false);
      });
    });
  });
}
