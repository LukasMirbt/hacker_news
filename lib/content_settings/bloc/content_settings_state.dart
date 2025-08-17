import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hacker_client/content_settings/content_settings.dart';

part 'content_settings_state.freezed.dart';

@freezed
abstract class ContentSettingsState with _$ContentSettingsState {
  const factory ContentSettingsState({
    @Default(LinkLaunchMode.inApp) LinkLaunchMode linkLaunchMode,
  }) = _ContentSettingsState;
}
