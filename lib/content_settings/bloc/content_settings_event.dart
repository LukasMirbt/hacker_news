import 'package:equatable/equatable.dart';
import 'package:settings_storage/settings_storage.dart';

sealed class ContentSettingsEvent extends Equatable {
  const ContentSettingsEvent();
}

final class ContentSettingsLinkLaunchModeChanged extends ContentSettingsEvent {
  const ContentSettingsLinkLaunchModeChanged(this.mode);

  final LinkLaunchMode mode;

  @override
  List<Object> get props => [mode];
}
