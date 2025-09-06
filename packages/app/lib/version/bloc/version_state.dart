import 'package:app/version/version.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'version_state.freezed.dart';

@freezed
class VersionState with _$VersionState {
  VersionState({
    VersionModel? version,
  }) : version = version ?? VersionModel.empty;

  @override
  final VersionModel version;
}
