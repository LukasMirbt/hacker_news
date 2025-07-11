import 'package:equatable/equatable.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

final class SettingsPrivacyPolicyPressed extends SettingsEvent {
  const SettingsPrivacyPolicyPressed();
}
