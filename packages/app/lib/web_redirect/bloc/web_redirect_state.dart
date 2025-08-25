import 'package:app/web_redirect/web_redirect.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'web_redirect_state.freezed.dart';

enum InitialLoadStatus {
  loading,
  success;

  bool get isLoading => this == loading;
}

@freezed
abstract class WebRedirectState with _$WebRedirectState {
  const factory WebRedirectState({
    required WebRedirectModel redirect,
    @Default(InitialLoadStatus.loading) InitialLoadStatus initialLoadStatus,
    @Default(WebRedirectProgressModel()) WebRedirectProgressModel progress,
    @Default(false) bool canGoBack,
    @Default(false) bool canGoForward,
  }) = _WebRedirectState;

  factory WebRedirectState.from(WebRedirect redirect) {
    return WebRedirectState(
      redirect: WebRedirectModel.from(redirect),
    );
  }
}
