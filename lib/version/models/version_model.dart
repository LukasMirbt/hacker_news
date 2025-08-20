import 'package:equatable/equatable.dart';
import 'package:version_repository/version_repository.dart';

class VersionModel extends Equatable {
  const VersionModel(this._version);

  final Version _version;

  static final empty = VersionModel(
    Version(0, 0, 0),
  );

  String get label => _version.toString();

  @override
  List<Object?> get props => [_version];
}
