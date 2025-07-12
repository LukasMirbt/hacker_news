import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/create_account/create_account.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  CreateAccountBloc({
    required String from,
    required AuthenticationRepository authenticationRepository,
  }) : _repository = authenticationRepository,
       super(
         CreateAccountState(from: from),
       ) {
    on<CreateAccountUsernameChanged>(_onUsernameChanged);
    on<CreateAccountPasswordChanged>(_onPasswordChanged);
    on<CreateAccountPasswordVisibilityToggled>(_onPasswordVisibilityToggled);
    on<CreateAccountSubmitted>(_onSubmitted);
  }

  final AuthenticationRepository _repository;

  void _onUsernameChanged(
    CreateAccountUsernameChanged event,
    Emitter<CreateAccountState> emit,
  ) {
    emit(
      state.copyWith(
        username: event.username,
      ),
    );
  }

  void _onPasswordChanged(
    CreateAccountPasswordChanged event,
    Emitter<CreateAccountState> emit,
  ) {
    emit(
      state.copyWith(
        password: event.password,
      ),
    );
  }

  void _onPasswordVisibilityToggled(
    CreateAccountPasswordVisibilityToggled event,
    Emitter<CreateAccountState> emit,
  ) {
    emit(
      state.copyWith(
        obscurePassword: !state.obscurePassword,
      ),
    );
  }

  Future<void> _onSubmitted(
    CreateAccountSubmitted event,
    Emitter<CreateAccountState> emit,
  ) async {
    emit(
      state.copyWith(
        status: CreateAccountStatus.loading,
      ),
    );

    try {
      await _repository.login(
        username: state.username,
        password: state.password,
      );

      emit(
        state.copyWith(
          status: CreateAccountStatus.success,
        ),
      );
    } catch (e, s) {
      addError(e, s);
      emit(
        state.copyWith(
          status: CreateAccountStatus.failure,
        ),
      );
    }
  }
}
