import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hacker_client/version/version.dart';

part 'version_state.freezed.dart';

@freezed
abstract class VersionState with _$VersionState {
  const factory VersionState({
    @Default(VersionModel.empty) VersionModel model,
  }) = _VersionState;
}
