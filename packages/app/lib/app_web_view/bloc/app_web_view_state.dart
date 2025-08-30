import 'package:app/app_web_view/app_web_view.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_web_view_state.freezed.dart';

enum InitialLoadStatus {
  loading,
  success;

  bool get isLoading => this == loading;
}

enum NavigationDecision {
  prevent,
  navigate,
}

typedef OnNavigationRequest = NavigationDecision Function(Uri url);

@freezed
abstract class AppWebViewState with _$AppWebViewState {
  const factory AppWebViewState({
    required AppWebViewConfiguration configuration,
    OnNavigationRequest? onNavigationRequest,
    @Default(InitialLoadStatus.loading) InitialLoadStatus initialLoadStatus,
    @Default(AppWebViewProgressModel()) AppWebViewProgressModel progress,
    @Default(false) bool canGoBack,
    @Default(false) bool canGoForward,
    Uri? url,
  }) = _AppWebViewState;

  factory AppWebViewState.from({
    required AppWebViewConfiguration configuration,
    OnNavigationRequest? onNavigationRequest,
  }) {
    return AppWebViewState(
      configuration: configuration,
      onNavigationRequest: onNavigationRequest,
    );
  }

  const AppWebViewState._();

  String get title {
    final url = this.url;
    if (url == null) return '';
    return url.host;
  }

  bool get isShareEnabled => url != null;
}
