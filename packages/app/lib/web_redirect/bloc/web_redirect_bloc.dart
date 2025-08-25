import 'package:app/web_redirect/web_redirect.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WebRedirectBloc extends Bloc<WebRedirectEvent, WebRedirectState> {
  WebRedirectBloc({
    required WebRedirect redirect,
    required WebRedirectCookieManager webRedirectCookieManager,
    required WebRedirectController webRedirectController,
    required AuthenticationRepository authenticationRepository,
  }) : _cookieManager = webRedirectCookieManager,
       _controller = webRedirectController,
       _repository = authenticationRepository,
       super(
         WebRedirectState.from(redirect),
       ) {
    on<WebRedirectStarted>(_onStarted);
    on<WebRedirectCreated>(_onCreated);
    on<WebRedirectLoadStarted>(_onLoadStarted);
    on<WebRedirectVisitedHistoryUpdated>(_onVisitedHistoryUpdated);
    on<WebRedirectProgressChanged>(_onProgressChanged);
    on<WebRedirectLoadStopped>(_onLoadStopped);
    on<WebRedirectBackPressed>(_onBackPressed);
    on<WebRedirectForwardPressed>(_onForwardPressed);
    on<WebRedirectReloadPressed>(_onReloadPressed);
  }

  final WebRedirectCookieManager _cookieManager;
  final WebRedirectController _controller;
  final AuthenticationRepository _repository;

  Future<void> _onStarted(
    WebRedirectStarted event,
    Emitter<WebRedirectState> emit,
  ) async {
    final cookies = await _repository.cookies();

    await _cookieManager.setCookies(
      url: state.redirect.url,
      cookies: cookies,
    );

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
        progress: 0,
      ),
    );
  }

  Future<void> _onVisitedHistoryUpdated(
    WebRedirectVisitedHistoryUpdated event,
    Emitter<WebRedirectState> emit,
  ) async {
    final canGoBack = await _controller.canGoBack();
    final canGoForward = await _controller.canGoForward();

    emit(
      state.copyWith(
        canGoBack: canGoBack,
        canGoForward: canGoForward,
      ),
    );
  }

  void _onProgressChanged(
    WebRedirectProgressChanged event,
    Emitter<WebRedirectState> emit,
  ) {
    emit(
      state.copyWith(
        progress: event.progress,
      ),
    );
  }

  Future<void> _onLoadStopped(
    WebRedirectLoadStopped event,
    Emitter<WebRedirectState> emit,
  ) async {
    final baseUrl = _repository.state.baseUrl;
    final cookies = await _cookieManager.cookies(baseUrl);

    // TODO(LukasMirbt): Save cookies more efficiently
    await _repository.saveCookies(cookies);

    final html = await _controller.html();

    if (html != null) {
      _repository.updateAuthenticationFromHtml(html);
    }

    final canGoBack = await _controller.canGoBack();
    final canGoForward = await _controller.canGoForward();

    emit(
      state.copyWith(
        canGoBack: canGoBack,
        canGoForward: canGoForward,
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
