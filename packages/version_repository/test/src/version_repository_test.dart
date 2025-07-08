// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:version/version.dart' as package_version;
import 'package:version_repository/version_repository.dart' hide Version;

class _MockPackageInfoWrapper extends Mock implements PackageInfoWrapper {}

void main() {
  group(VersionRepository, () {
    late PackageInfoWrapper packageInfoWrapper;

    setUp(() {
      packageInfoWrapper = _MockPackageInfoWrapper();
    });

    VersionRepository createSubject() {
      return VersionRepository(
        packageInfoWrapper: packageInfoWrapper,
      );
    }

    group('constructor', () {
      test('returns normally', () {
        expect(VersionRepository.new, returnsNormally);
      });
    });

    group('currentVersion', () {
      final fromPlatform = () => packageInfoWrapper.fromPlatform();

      test('returns ${package_version.Version} '
          'when fromPlatform succeeds', () async {
        const version = '1.0.0';
        final packageInfo = PackageInfo(
          appName: 'appName',
          packageName: 'packageName',
          version: version,
          buildNumber: 'buildNumber',
        );
        when(fromPlatform).thenAnswer((_) async => packageInfo);
        final repository = createSubject();
        expect(
          repository.currentVersion(),
          completion(
            package_version.Version.parse(version),
          ),
        );
        verify(fromPlatform).called(1);
      });

      test('throws $PackageInfoException when fromPlatform fails', () {
        final exception = Exception('oops');
        when(fromPlatform).thenThrow(exception);
        final repository = createSubject();
        expect(
          repository.currentVersion(),
          throwsA(
            PackageInfoException(exception),
          ),
        );
        verify(fromPlatform).called(1);
      });
    });

    group('currentBuild', () {
      final fromPlatform = () => packageInfoWrapper.fromPlatform();

      test('returns buildNumber when fromPlatform succeeds', () async {
        final packageInfo = PackageInfo(
          appName: 'appName',
          packageName: 'packageName',
          version: 'version',
          buildNumber: 'buildNumber',
        );
        when(fromPlatform).thenAnswer((_) async => packageInfo);
        final repository = createSubject();
        expect(
          repository.currentBuild(),
          completion(
            Build.maybeFrom(packageInfo.buildNumber),
          ),
        );
        verify(fromPlatform).called(1);
      });

      test('throws $PackageInfoException when fromPlatform fails', () {
        final exception = Exception('oops');
        when(packageInfoWrapper.fromPlatform).thenThrow(exception);
        final repository = createSubject();
        expect(
          repository.currentBuild(),
          throwsA(
            PackageInfoException(exception),
          ),
        );
        verify(fromPlatform).called(1);
      });
    });
  });
}
