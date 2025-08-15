import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart'
    hide AuthenticationState;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/authentication/authentication.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
  }) : _repository = authenticationRepository,
       super(
         AuthenticationState(
           user: authenticationRepository.state.user,
           loginRedirect: authenticationRepository.state.loginRedirect,
           webRedirect: authenticationRepository.state.webRedirect,
           status: authenticationRepository.state.status,
         ),
       ) {
    on<AuthenticationSubscriptionRequested>(
      _onSubscriptionRequested,
    );
    on<AuthenticationLogoutPressed>(_onLogoutPressed);
  }

  final AuthenticationRepository _repository;

  Future<void> _onSubscriptionRequested(
    AuthenticationSubscriptionRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    return emit.forEach(
      _repository.stream,
      onData: (repositoryState) => state.copyWith(
        user: repositoryState.user,
        loginRedirect: repositoryState.loginRedirect,
        webRedirect: repositoryState.webRedirect,
        status: repositoryState.status,
      ),
    );
  }

  Future<void> _onLogoutPressed(
    AuthenticationLogoutPressed event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(
      state.copyWith(
        logoutStatus: LogoutStatus.loading,
      ),
    );

    try {
      await _repository.logout();

      emit(
        state.copyWith(
          logoutStatus: LogoutStatus.success,
        ),
      );
    } catch (e, s) {
      addError(e, s);
      emit(
        state.copyWith(
          logoutStatus: LogoutStatus.failure,
        ),
      );
    }
  }
}
