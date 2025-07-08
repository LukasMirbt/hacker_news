import 'package:flutter_test/flutter_test.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:version_repository/version_repository.dart';

void main() {
  group(PackageInfoWrapper, () {
    group('fromPlatform', () {
      test('returns packageInfo', () {
        PackageInfo.setMockInitialValues(
          appName: 'appName',
          packageName: 'packageName',
          version: 'version',
          buildNumber: 'buildNumber',
          buildSignature: 'buildSignature',
        );
        final wrapper = PackageInfoWrapper();
        expect(
          wrapper.fromPlatform(),
          completion(
            isA<PackageInfo>(),
          ),
        );
      });
    });
  });
}
