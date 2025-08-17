import 'package:equatable/equatable.dart';
import 'package:hacker_client/content_settings/content_settings.dart';

sealed class ContentSettingsEvent extends Equatable {
  const ContentSettingsEvent();

  @override
  List<Object> get props => [];
}

final class ContentSettingsLinkLaunchModeChanged extends ContentSettingsEvent {
  const ContentSettingsLinkLaunchModeChanged(this.mode);

  final LinkLaunchMode mode;

  @override
  List<Object> get props => [mode];
}
