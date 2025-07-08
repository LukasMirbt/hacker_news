import 'package:flutter_test/flutter_test.dart';
import 'package:version_repository/src/models/build.dart';

void main() {
  group(Build, () {
    group('maybeFrom', () {
      test('returns correct number when buildNumber is an int', () {
        final build = Build.maybeFrom('1');
        expect(build, 1);
      });

      test(
        'returns null when buildNumber is not an int',
        () {
          final build = Build.maybeFrom('');
          expect(build, null);
        },
      );
    });
  });
}
