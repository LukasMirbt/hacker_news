import 'package:app/web_redirect/web_redirect.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'web_redirect_state.freezed.dart';

enum InitialLoadStatus {
  loading,
  success;

  bool get isLoading => this == loading;
}

enum PageLoadStatus {
  initial,
  loading,
  success,
  failure,
}

typedef OnNavigationRequest = NavigationDecision Function(Uri url);

@freezed
abstract class WebRedirectState with _$WebRedirectState {
  const factory WebRedirectState({
    required WebRedirectModel redirect,
    OnNavigationRequest? onNavigationRequest,
    @Default(InitialLoadStatus.loading) InitialLoadStatus initialLoadStatus,
    @Default(false) bool canGoBack,
    @Default(false) bool canGoForward,
    @Default(0) int progress,
  }) = _WebRedirectState;

  factory WebRedirectState.from({
    required WebRedirect redirect,
    required OnNavigationRequest? onNavigationRequest,
  }) {
    return WebRedirectState(
      redirect: WebRedirectModel.from(redirect),
      onNavigationRequest: onNavigationRequest,
    );
  }

  const WebRedirectState._();

  double get progressValue => progress / 100;
}
