import 'package:app/version/version.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:version_repository/version_repository.dart';

void main() {
  group(VersionModel, () {
    VersionModel createSubject(Version version) {
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

    group('label', () {
      test('returns correct value', () {
        final version = Version(1, 0, 0);
        final model = createSubject(version);
        expect(model.label, '1.0.0');
      });
    });
  });
}
