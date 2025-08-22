import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/create_account/create_account.dart';
import 'package:hacker_client/external_links/external_links.dart';
import 'package:link_launcher/link_launcher.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  CreateAccountBloc({
    required String from,
    required AuthenticationRepository authenticationRepository,
    required LinkLauncher linkLauncher,
  }) : _repository = authenticationRepository,
       _launcher = linkLauncher,
       super(
         CreateAccountState(from: from),
       ) {
    on<CreateAccountUsernameChanged>(_onUsernameChanged);
    on<CreateAccountUsernameRestored>(_onUsernameRestored);
    on<CreateAccountPasswordChanged>(_onPasswordChanged);
    on<CreateAccountPasswordVisibilityToggled>(_onPasswordVisibilityToggled);
    on<CreateAccountTermsPressed>(_onTermsPressed);
    on<CreateAccountPrivacyPolicyPressed>(_onPrivacyPolicyPressed);
    on<CreateAccountSubmitted>(_onSubmitted);
  }

  final AuthenticationRepository _repository;
  final LinkLauncher _launcher;

  void _onUsernameChanged(
    CreateAccountUsernameChanged event,
    Emitter<CreateAccountState> emit,
  ) {
    emit(
      state.copyWith.form(
        username: Username(event.username),
      ),
    );
  }

  void _onUsernameRestored(
    CreateAccountUsernameRestored event,
    Emitter<CreateAccountState> emit,
  ) {
    emit(
      state.copyWith.form(
        username: Username(event.username),
      ),
    );
  }

  void _onPasswordChanged(
    CreateAccountPasswordChanged event,
    Emitter<CreateAccountState> emit,
  ) {
    emit(
      state.copyWith.form(
        password: Password(event.password),
      ),
    );
  }

  void _onPasswordVisibilityToggled(
    CreateAccountPasswordVisibilityToggled event,
    Emitter<CreateAccountState> emit,
  ) {
    emit(
      state.copyWith.form(
        obscurePassword: !state.form.obscurePassword,
      ),
    );
  }

  void _onTermsPressed(
    CreateAccountTermsPressed event,
    Emitter<CreateAccountState> emit,
  ) {
    _launcher.launch(hackerNewsTermsLink);
  }

  void _onPrivacyPolicyPressed(
    CreateAccountPrivacyPolicyPressed event,
    Emitter<CreateAccountState> emit,
  ) {
    _launcher.launch(hackerNewsPrivacyPolicyLink);
  }

  Future<void> _onSubmitted(
    CreateAccountSubmitted event,
    Emitter<CreateAccountState> emit,
  ) async {
    final form = state.form;

    if (!form.isValid) {
      return emit(
        state.copyWith.form(
          status: CreateAccountStatus.invalid,
        ),
      );
    }

    emit(
      state.copyWith.form(
        status: CreateAccountStatus.loading,
      ),
    );

    try {
      await _repository.createAccount(
        username: form.username.value,
        password: form.password.value,
      );

      emit(
        state.copyWith.form(
          status: CreateAccountStatus.success,
        ),
      );
    } catch (e, s) {
      addError(e, s);
      emit(
        state.copyWith.form(
          status: CreateAccountStatus.failure,
        ),
      );
    }
  }
}
