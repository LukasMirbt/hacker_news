import 'dart:async';

import 'package:authentication_api/authentication_api.dart';
import 'package:bloc/bloc.dart';
import 'package:user_api/user_api.dart';

class UserRepository extends Cubit<User> {
  UserRepository({
    required UserApi userApi,
    required AuthenticationApi authenticationApi,
  }) : _userApi = userApi,
       _authenticationApi = authenticationApi,
       super(User.empty) {
    _authenticationApi.stream
        .map((state) => state.status)
        .distinct()
        .listen(_onStatusChanged);
  }

  final UserApi _userApi;
  final AuthenticationApi _authenticationApi;

  Future<void> _onStatusChanged(AuthenticationStatus status) async {
    switch (status) {
      case AuthenticationStatus.initial:
        try {
          final user = await _userApi.fetchUser();
          _authenticationApi.authenticate();
          emit(user);
        } catch (e) {
          if (e case DioException(
            type: DioExceptionType.connectionError ||
                DioExceptionType.connectionTimeout ||
                DioExceptionType.receiveTimeout ||
                DioExceptionType.sendTimeout,
          )) {
            _authenticationApi.initialNetworkError();
          } else {
            await _authenticationApi.unauthenticate();
            emit(User.empty);
          }
        }
      case AuthenticationStatus.authenticated:
        if (state.isNotEmpty) return;

        try {
          final user = await _userApi.fetchUser();
          emit(user);
        } on NetworkError catch (_) {
          _authenticationApi.initialNetworkError();
        } catch (_) {
          emit(User.empty);
          _logger.severe('Failed to fetch user');
        }
      case AuthenticationStatus.unauthenticated:
        emit(User.empty);
      case AuthenticationStatus.initialNetworkError:
        break;
    }
  }
}
