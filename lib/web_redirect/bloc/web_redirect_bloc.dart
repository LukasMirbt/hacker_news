import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';

class WebRedirectBloc extends Bloc<WebRedirectEvent, WebRedirectState> {
  WebRedirectBloc({
    required WebRedirect redirect,
    required WebRedirectCookieManager webRedirectCookieManager,
    required WebRedirectActionModel webRedirectActionModel,
    required AuthenticationRepository authenticationRepository,
  }) : _cookieManager = webRedirectCookieManager,
       _actionModel = webRedirectActionModel,
       _repository = authenticationRepository,
       super(
         WebRedirectState.from(redirect),
       ) {
    on<WebRedirectStarted>(_onStarted);
    on<WebRedirectCreated>(_onCreated);
    on<WebRedirectLoadStarted>(_onLoadStarted);
    on<WebRedirectProgressChanged>(_onProgressChanged);
    on<WebRedirectLoadStopped>(_onLoadStopped);
    on<WebRedirectBackPressed>(_onBackPressed);
    on<WebRedirectForwardPressed>(_onForwardPressed);
    on<WebRedirectReloadPressed>(_onReloadPressed);
  }

  final WebRedirectCookieManager _cookieManager;
  final WebRedirectActionModel _actionModel;
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
    _actionModel.initialize(event.controller);
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

    await _repository.saveCookies(cookies);

    final canGoBack = await _actionModel.canGoBack();
    final canGoForward = await _actionModel.canGoForward();

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
    _actionModel.goBack();
  }

  void _onForwardPressed(
    WebRedirectForwardPressed event,
    Emitter<WebRedirectState> emit,
  ) {
    _actionModel.goForward();
  }

  void _onReloadPressed(
    WebRedirectReloadPressed event,
    Emitter<WebRedirectState> emit,
  ) {
    _actionModel.reload();
  }
}
