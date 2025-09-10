import 'dart:async';

import 'package:app/authentication/authentication.dart';
import 'package:authentication_repository/authentication_repository.dart'
    hide AuthenticationState;
import 'package:flutter_bloc/flutter_bloc.dart';

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
  }

  final AuthenticationRepository _repository;

  Future<void> _onSubscriptionRequested(
    AuthenticationSubscriptionRequested event,
    Emitter<AuthenticationState> emit,
  ) {
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
}
