import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/version/version.dart';
import 'package:version_repository/version_repository.dart';

void main() {
  group(VersionModel, () {
    VersionModel createSubject(Version? version) {
      return VersionModel(version);
    }

    group('empty', () {
      test('returns $VersionModel', () {
        expect(
          VersionModel.empty,
          isA<VersionModel>(),
        );
      });
    });

    group('version', () {
      test('returns null when version is null', () {
        final model = createSubject(null);
        expect(model.version, null);
      });

      test('returns correct string when version is non-null', () {
        final version = Version(1, 0, 0);
        final model = createSubject(version);
        expect(model.version, version.toString());
      });
    });
  });
}
