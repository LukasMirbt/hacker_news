import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoWrapper {
  Future<PackageInfo> fromPlatform() {
    return PackageInfo.fromPlatform();
  }
}
