import 'package:equatable/equatable.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

sealed class AppWebViewEvent extends Equatable {
  const AppWebViewEvent();

  @override
  List<Object?> get props => [];
}

final class AppWebViewStarted extends AppWebViewEvent {
  const AppWebViewStarted();
}

final class AppWebViewCreated extends AppWebViewEvent {
  const AppWebViewCreated(this.controller);

  final InAppWebViewController controller;

  @override
  List<Object> get props => [controller];
}

final class AppWebViewProgressChanged extends AppWebViewEvent {
  const AppWebViewProgressChanged(this.progress);

  final int progress;

  @override
  List<Object> get props => [progress];
}

final class AppWebViewLoadStarted extends AppWebViewEvent {
  const AppWebViewLoadStarted(this.url);

  final Uri? url;

  @override
  List<Object?> get props => [url];
}

final class AppWebViewVisitedHistoryUpdated extends AppWebViewEvent {
  const AppWebViewVisitedHistoryUpdated(this.url);

  final Uri? url;

  @override
  List<Object?> get props => [url];
}

final class AppWebViewLoadStopped extends AppWebViewEvent {
  const AppWebViewLoadStopped(this.url);

  final Uri? url;

  @override
  List<Object?> get props => [url];
}

final class AppWebViewReceivedError extends AppWebViewEvent {
  const AppWebViewReceivedError(this.url);

  final Uri? url;

  @override
  List<Object?> get props => [url];
}

final class AppWebViewBackPressed extends AppWebViewEvent {
  const AppWebViewBackPressed();
}

final class AppWebViewForwardPressed extends AppWebViewEvent {
  const AppWebViewForwardPressed();
}

final class AppWebViewReloadPressed extends AppWebViewEvent {
  const AppWebViewReloadPressed();
}
