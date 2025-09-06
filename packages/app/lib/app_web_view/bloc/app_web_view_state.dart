import 'package:app/app_web_view/app_web_view.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_web_view_state.freezed.dart';

enum InitialLoadStatus {
  loading,
  success;

  bool get isLoading => this == loading;
}

@freezed
abstract class AppWebViewState with _$AppWebViewState {
  const factory AppWebViewState({
    required AppWebViewConfiguration configuration,
    required PreventedNavigation preventedNavigation,
    @Default(InitialLoadStatus.loading) InitialLoadStatus initialLoadStatus,
    @Default(AppWebViewProgressModel()) AppWebViewProgressModel progress,
    @Default(false) bool canGoBack,
    @Default(false) bool canGoForward,
    Uri? url,
  }) = _AppWebViewState;

  factory AppWebViewState.from(
    AppWebViewConfiguration configuration,
  ) {
    return AppWebViewState(
      configuration: configuration,
      preventedNavigation: PreventedNavigation.empty,
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
