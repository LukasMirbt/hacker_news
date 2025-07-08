import 'package:equatable/equatable.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

sealed class WebRedirectEvent extends Equatable {
  const WebRedirectEvent();

  @override
  List<Object?> get props => [];
}

final class WebRedirectStarted extends WebRedirectEvent {
  const WebRedirectStarted();
}

final class WebRedirectCreated extends WebRedirectEvent {
  const WebRedirectCreated(this.controller);

  final InAppWebViewController controller;

  @override
  List<Object> get props => [controller];
}

final class WebRedirectProgressChanged extends WebRedirectEvent {
  const WebRedirectProgressChanged(this.progress);

  final int progress;

  @override
  List<Object> get props => [progress];
}

final class WebRedirectLoadStarted extends WebRedirectEvent {
  const WebRedirectLoadStarted();
}

final class WebRedirectLoadStopped extends WebRedirectEvent {
  const WebRedirectLoadStopped();
}

final class WebRedirectBackPressed extends WebRedirectEvent {
  const WebRedirectBackPressed();
}

final class WebRedirectForwardPressed extends WebRedirectEvent {
  const WebRedirectForwardPressed();
}

final class WebRedirectReloadPressed extends WebRedirectEvent {
  const WebRedirectReloadPressed();
}
