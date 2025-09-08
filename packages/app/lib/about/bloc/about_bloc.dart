import 'package:app/about/about.dart';
import 'package:app/external_links/external_links.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_launcher/link_launcher.dart';

class AboutBloc extends Bloc<AboutEvent, void> {
  AboutBloc({
    required LinkLauncher linkLauncher,
  }) : _launcher = linkLauncher,
       super(null) {
    on<AboutPrivacyPolicyPressed>(_onPrivacyPolicyPressed);
    on<AboutSourceCodePressed>(_onSourceCodePressed);
  }

  final LinkLauncher _launcher;

  void _onPrivacyPolicyPressed(
    AboutPrivacyPolicyPressed event,
    Emitter<void> emit,
  ) {
    _launcher.launch(axiomPrivacyPolicyLink);
  }

  void _onSourceCodePressed(
    AboutSourceCodePressed event,
    Emitter<void> emit,
  ) {
    _launcher.launch(axiomSourceCodeLink);
  }
}
