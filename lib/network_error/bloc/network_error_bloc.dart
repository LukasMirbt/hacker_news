import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/network_error/network_error.dart';

class NetworkErrorBloc extends Bloc<NetworkErrorEvent, NetworkErrorState> {
  NetworkErrorBloc({
    required AuthenticationRepository authenticationRepository,
  }) : _repository = authenticationRepository,
       super(
         const NetworkErrorState(),
       ) {
    on<NetworkErrorRetryPressed>(_onRetryPressed);
  }

  final AuthenticationRepository _repository;

  Future<void> _onRetryPressed(
    NetworkErrorRetryPressed event,
    Emitter<NetworkErrorState> emit,
  ) async {
    emit(
      state.copyWith(
        status: NetworkErrorStatus.loading,
      ),
    );

    await _repository.start();

    final isNetworkError = _repository.state.status.isNetworkError;

    emit(
      state.copyWith(
        status: isNetworkError
            ? NetworkErrorStatus.failure
            : NetworkErrorStatus.success,
      ),
    );
  }
}
