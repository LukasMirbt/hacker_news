import 'package:flutter_test/flutter_test.dart';
import 'package:post_repository/post_repository.dart';

void main() {
  group(FetchStatus, () {
    group('isLoading', () {
      test('returns true when status is ${FetchStatus.loading}', () {
        const status = FetchStatus.loading;
        expect(status.isLoading, true);
      });

      test('returns false when status is not ${FetchStatus.loading}', () {
        const status = FetchStatus.success;
        expect(status.isLoading, false);
      });
    });

    group('isSuccess', () {
      test('returns true when status is ${FetchStatus.success}', () {
        const status = FetchStatus.success;
        expect(status.isSuccess, true);
      });

      test('returns false when status is not ${FetchStatus.success}', () {
        const status = FetchStatus.loading;
        expect(status.isSuccess, false);
      });
    });

    group('isFailure', () {
      test('returns true when status is ${FetchStatus.failure}', () {
        const status = FetchStatus.failure;
        expect(status.isFailure, true);
      });

      test('returns false when status is not ${FetchStatus.failure}', () {
        const status = FetchStatus.loading;
        expect(status.isFailure, false);
      });
    });
  });

  group('refreshStatus', () {
    group('isLoading', () {
      test('returns true when status is ${RefreshStatus.loading}', () {
        const status = RefreshStatus.loading;
        expect(status.isLoading, true);
      });

      test('returns false when status is not ${RefreshStatus.loading}', () {
        const status = RefreshStatus.success;
        expect(status.isLoading, false);
      });
    });
  });
}
