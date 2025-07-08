import 'package:equatable/equatable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:version/version.dart' as package_version;
import 'package:version_repository/version_repository.dart';

class PackageInfoException with EquatableMixin implements Exception {
  const PackageInfoException(this.error);

  final Object? error;

  @override
  List<Object?> get props => [];
}

class VersionRepository {
  VersionRepository({
    PackageInfoWrapper? packageInfoWrapper,
  }) : _packageInfoWrapper = packageInfoWrapper ?? PackageInfoWrapper();

  final PackageInfoWrapper _packageInfoWrapper;

  Future<package_version.Version> currentVersion() async {
    PackageInfo packageInfo;

    try {
      packageInfo = await _packageInfoWrapper.fromPlatform();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        PackageInfoException(error),
        stackTrace,
      );
    }

    return package_version.Version.parse(packageInfo.version);
  }

  Future<int?> currentBuild() async {
    PackageInfo packageInfo;

    try {
      packageInfo = await _packageInfoWrapper.fromPlatform();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        PackageInfoException(error),
        stackTrace,
      );
    }

    return Build.maybeFrom(packageInfo.buildNumber);
  }
}
