import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:link_launcher/link_launcher.dart';

part 'content_settings_state.freezed.dart';

@freezed
abstract class ContentSettingsState with _$ContentSettingsState {
  const factory ContentSettingsState({
    required LinkLaunchMode linkLaunchMode,
  }) = _ContentSettingsState;
}
