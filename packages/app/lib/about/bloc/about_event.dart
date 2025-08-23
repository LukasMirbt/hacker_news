import 'package:equatable/equatable.dart';

sealed class AboutEvent extends Equatable {
  const AboutEvent();

  @override
  List<Object> get props => [];
}

final class AboutPrivacyPolicyPressed extends AboutEvent {
  const AboutPrivacyPolicyPressed();
}
