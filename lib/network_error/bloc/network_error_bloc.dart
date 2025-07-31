import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/network_error/network_error.dart';

class NetworkErrorBloc extends Bloc<NetworkErrorEvent, NetworkErrorState> {
  NetworkErrorBloc({
    required String from,
    required AuthenticationRepository authenticationRepository,
  }) : _repository = authenticationRepository,
       super(
         NetworkErrorState(from: from),
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

    try {
      await _repository.start();

      emit(
        state.copyWith(
          status: NetworkErrorStatus.success,
        ),
      );
    } catch (e, s) {
      addError(e, s);
      emit(
        state.copyWith(
          status: NetworkErrorStatus.failure,
        ),
      );
    }
  }
}
