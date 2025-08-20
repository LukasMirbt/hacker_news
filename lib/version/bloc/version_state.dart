import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hacker_client/version/version.dart';

part 'version_state.freezed.dart';

@freezed
class VersionState with _$VersionState {
  VersionState({
    VersionModel? version,
  }) : version = version ?? VersionModel.empty;

  @override
  final VersionModel version;
}
