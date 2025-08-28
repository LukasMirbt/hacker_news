import 'package:app/web_redirect/web_redirect.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WebRedirectBloc extends Bloc<WebRedirectEvent, WebRedirectState> {
  WebRedirectBloc({
    required WebRedirect redirect,
    required WebRedirectController webRedirectController,
    required WebRedirectAuthenticationModel webRedirectAuthenticationModel,
    OnNavigationRequest? onNavigationRequest,
  }) : _controller = webRedirectController,
       _authenticationModel = webRedirectAuthenticationModel,
       super(
         WebRedirectState.from(
           redirect: redirect,
           onNavigationRequest: onNavigationRequest,
         ),
       ) {
    on<WebRedirectStarted>(_onStarted);
    on<WebRedirectCreated>(_onCreated);
    on<WebRedirectLoadStarted>(_onLoadStarted);
    on<WebRedirectVisitedHistoryUpdated>(_onVisitedHistoryUpdated);
    on<WebRedirectProgressChanged>(_onProgressChanged);
    on<WebRedirectLoadStopped>(_onLoadStopped);
    on<WebRedirectReceivedError>(_onReceivedError);
    on<WebRedirectBackPressed>(_onBackPressed);
    on<WebRedirectForwardPressed>(_onForwardPressed);
    on<WebRedirectReloadPressed>(_onReloadPressed);
  }

  final WebRedirectAuthenticationModel _authenticationModel;
  final WebRedirectController _controller;

  Future<void> _onStarted(
    WebRedirectStarted event,
    Emitter<WebRedirectState> emit,
  ) async {
    await _authenticationModel.syncCookiesToWebView();

    emit(
      state.copyWith(
        initialLoadStatus: InitialLoadStatus.success,
      ),
    );
  }

  void _onCreated(
    WebRedirectCreated event,
    Emitter<WebRedirectState> emit,
  ) {
    _controller.initialize(event.controller);
  }

  void _onLoadStarted(
    WebRedirectLoadStarted event,
    Emitter<WebRedirectState> emit,
  ) {
    emit(
      state.copyWith(
        progress: const WebRedirectProgressModel(
          status: PageLoading(),
        ),
      ),
    );
  }

  Future<void> _onVisitedHistoryUpdated(
    WebRedirectVisitedHistoryUpdated event,
    Emitter<WebRedirectState> emit,
  ) async {
    final canGoBack = await _controller.canGoBack();
    final canGoForward = await _controller.canGoForward();
    final title = await _controller.title();
    final url = await _controller.url();

    emit(
      state.copyWith(
        canGoBack: canGoBack,
        canGoForward: canGoForward,
        title: title,
        url: url,
      ),
    );
  }

  void _onProgressChanged(
    WebRedirectProgressChanged event,
    Emitter<WebRedirectState> emit,
  ) {
    if (!state.progress.status.isLoading) return;

    emit(
      state.copyWith(
        progress: WebRedirectProgressModel(
          status: PageLoading(event.progress),
        ),
      ),
    );
  }

  Future<void> _onLoadStopped(
    WebRedirectLoadStopped event,
    Emitter<WebRedirectState> emit,
  ) async {
    final url = event.url;
    final matchesAppHost = _authenticationModel.matchesAppHost(url);

    if (matchesAppHost) {
      await _authenticationModel.syncCookiesToApp();
      await _authenticationModel.updateAuthenticationFromHtml();
    }

    final canGoBack = await _controller.canGoBack();
    final canGoForward = await _controller.canGoForward();
    final title = await _controller.title();
    final currentUrl = await _controller.url();

    emit(
      state.copyWith(
        progress: const WebRedirectProgressModel(
          status: PageSuccess(),
        ),
        canGoBack: canGoBack,
        canGoForward: canGoForward,
        title: title,
        url: currentUrl,
      ),
    );
  }

  Future<void> _onReceivedError(
    WebRedirectReceivedError event,
    Emitter<WebRedirectState> emit,
  ) async {
    final canGoBack = await _controller.canGoBack();
    final canGoForward = await _controller.canGoForward();
    final title = await _controller.title();
    final url = await _controller.url();

    emit(
      state.copyWith(
        progress: const WebRedirectProgressModel(
          status: PageFailure(),
        ),
        canGoBack: canGoBack,
        canGoForward: canGoForward,
        title: title,
        url: url,
      ),
    );
  }

  void _onBackPressed(
    WebRedirectBackPressed event,
    Emitter<WebRedirectState> emit,
  ) {
    _controller.goBack();
  }

  void _onForwardPressed(
    WebRedirectForwardPressed event,
    Emitter<WebRedirectState> emit,
  ) {
    _controller.goForward();
  }

  void _onReloadPressed(
    WebRedirectReloadPressed event,
    Emitter<WebRedirectState> emit,
  ) {
    _controller.reload();
  }
}
