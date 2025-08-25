import 'package:app/web_redirect/web_redirect.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_launcher/share_launcher.dart';

class WebRedirectBloc extends Bloc<WebRedirectEvent, WebRedirectState> {
  WebRedirectBloc({
    required WebRedirect redirect,
    required WebRedirectCookieManager webRedirectCookieManager,
    required WebRedirectController webRedirectController,
    required AuthenticationRepository authenticationRepository,
    ShareLauncher? shareLauncher,
    OnNavigationRequest? onNavigationRequest,
  }) : _cookieManager = webRedirectCookieManager,
       _controller = webRedirectController,
       _repository = authenticationRepository,
       _shareLauncher = shareLauncher ?? ShareLauncher(),
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
    on<WebRedirectBackPressed>(_onBackPressed);
    on<WebRedirectForwardPressed>(_onForwardPressed);
    on<WebRedirectSharePressed>(_onSharePressed);
  }

  final WebRedirectCookieManager _cookieManager;
  final WebRedirectController _controller;
  final AuthenticationRepository _repository;
  final ShareLauncher _shareLauncher;

  Future<void> _onStarted(
    WebRedirectStarted event,
    Emitter<WebRedirectState> emit,
  ) async {
    final cookies = await _repository.cookies();

    await _cookieManager.setCookies(
      url: _repository.state.baseUrl,
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
    final url = event.url;
    final baseUrl = _repository.state.baseUrl;

    if (url != null && url.host == baseUrl.host) {
      final cookies = await _cookieManager.cookies(url);
      await _repository.saveCookies(url, cookies);

      final html = await _controller.html();

      if (html != null) {
        _repository.updateAuthenticationFromHtml(html);
      }
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

  void _onSharePressed(
    WebRedirectSharePressed event,
    Emitter<WebRedirectState> emit,
  ) {
    // TODO: Share current url, not initial url

    _shareLauncher.shareLink(
      url: state.redirect.url.toString(),
    );
  }
}
