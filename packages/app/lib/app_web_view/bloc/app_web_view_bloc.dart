import 'package:app/app_web_view/app_web_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWebViewBloc extends Bloc<AppWebViewEvent, AppWebViewState> {
  AppWebViewBloc({
    required AppWebViewConfiguration configuration,
    required AppWebViewController appWebViewController,
    required AppWebViewAuthenticationModel appWebViewAuthenticationModel,
    OnNavigationRequest? onNavigationRequest,
  }) : _controller = appWebViewController,
       _authenticationModel = appWebViewAuthenticationModel,
       super(
         AppWebViewState.from(
           configuration: configuration,
           onNavigationRequest: onNavigationRequest,
         ),
       ) {
    on<AppWebViewStarted>(_onStarted);
    on<AppWebViewCreated>(_onCreated);
    on<AppWebViewLoadStarted>(_onLoadStarted);
    on<AppWebViewVisitedHistoryUpdated>(_onVisitedHistoryUpdated);
    on<AppWebViewProgressChanged>(_onProgressChanged);
    on<AppWebViewLoadStopped>(_onLoadStopped);
    on<AppWebViewReceivedError>(_onReceivedError);
    on<AppWebViewBackPressed>(_onBackPressed);
    on<AppWebViewForwardPressed>(_onForwardPressed);
    on<AppWebViewReloadPressed>(_onReloadPressed);
  }

  final AppWebViewAuthenticationModel _authenticationModel;
  final AppWebViewController _controller;

  Future<void> _onStarted(
    AppWebViewStarted event,
    Emitter<AppWebViewState> emit,
  ) async {
    await _authenticationModel.syncCookiesToWebView();

    emit(
      state.copyWith(
        initialLoadStatus: InitialLoadStatus.success,
      ),
    );
  }

  void _onCreated(
    AppWebViewCreated event,
    Emitter<AppWebViewState> emit,
  ) {
    _controller.initialize(event.controller);
  }

  void _onLoadStarted(
    AppWebViewLoadStarted event,
    Emitter<AppWebViewState> emit,
  ) {
    emit(
      state.copyWith(
        url: event.url,
        progress: const AppWebViewProgressModel(
          status: PageLoading(),
        ),
      ),
    );
  }

  Future<void> _onVisitedHistoryUpdated(
    AppWebViewVisitedHistoryUpdated event,
    Emitter<AppWebViewState> emit,
  ) async {
    final canGoBack = await _controller.canGoBack();
    final canGoForward = await _controller.canGoForward();

    emit(
      state.copyWith(
        url: event.url,
        canGoBack: canGoBack,
        canGoForward: canGoForward,
      ),
    );
  }

  void _onProgressChanged(
    AppWebViewProgressChanged event,
    Emitter<AppWebViewState> emit,
  ) {
    if (!state.progress.status.isLoading) return;

    emit(
      state.copyWith(
        progress: AppWebViewProgressModel(
          status: PageLoading(event.progress),
        ),
      ),
    );
  }

  Future<void> _onLoadStopped(
    AppWebViewLoadStopped event,
    Emitter<AppWebViewState> emit,
  ) async {
    final url = event.url;
    final matchesAppHost = _authenticationModel.matchesAppHost(url);

    if (matchesAppHost) {
      await _authenticationModel.syncCookiesToApp();
      await _authenticationModel.updateAuthenticationFromHtml();
    }

    final canGoBack = await _controller.canGoBack();
    final canGoForward = await _controller.canGoForward();

    emit(
      state.copyWith(
        url: url,
        canGoBack: canGoBack,
        canGoForward: canGoForward,
        progress: const AppWebViewProgressModel(
          status: PageSuccess(),
        ),
      ),
    );
  }

  Future<void> _onReceivedError(
    AppWebViewReceivedError event,
    Emitter<AppWebViewState> emit,
  ) async {
    final canGoBack = await _controller.canGoBack();
    final canGoForward = await _controller.canGoForward();

    emit(
      state.copyWith(
        url: event.url,
        canGoBack: canGoBack,
        canGoForward: canGoForward,
        progress: const AppWebViewProgressModel(
          status: PageFailure(),
        ),
      ),
    );
  }

  void _onBackPressed(
    AppWebViewBackPressed event,
    Emitter<AppWebViewState> emit,
  ) {
    _controller.goBack();
  }

  void _onForwardPressed(
    AppWebViewForwardPressed event,
    Emitter<AppWebViewState> emit,
  ) {
    _controller.goForward();
  }

  void _onReloadPressed(
    AppWebViewReloadPressed event,
    Emitter<AppWebViewState> emit,
  ) {
    _controller.reload();
  }
}
