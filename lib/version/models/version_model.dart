import 'package:equatable/equatable.dart';
import 'package:version_repository/version_repository.dart';

class VersionModel extends Equatable {
  const VersionModel(this._version);

  final Version? _version;

  static const empty = VersionModel(null);

  String? get version {
    if (_version == null) return null;
    return _version.toString();
  }

  @override
  List<Object?> get props => [_version];
}
