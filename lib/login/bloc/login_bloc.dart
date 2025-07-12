import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/external_links/external_links.dart';
import 'package:hacker_client/login/login.dart';
import 'package:link_launcher/link_launcher.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required String from,
    required AuthenticationRepository authenticationRepository,
    LinkLauncher? linkLauncher,
  }) : _repository = authenticationRepository,
       _launcher = linkLauncher ?? const LinkLauncher(),
       super(
         LoginState(from: from),
       ) {
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginPasswordVisibilityToggled>(_onPasswordVisibilityToggled);
    on<LoginTermsPressed>(_onTermsPressed);
    on<LoginPrivacyPolicyPressed>(_onPrivacyPolicyPressed);
    on<LoginSubmitted>(_onSubmitted);
  }

  final AuthenticationRepository _repository;
  final LinkLauncher _launcher;

  void _onUsernameChanged(
    LoginUsernameChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(
        username: event.username,
      ),
    );
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(
        password: event.password,
      ),
    );
  }

  void _onPasswordVisibilityToggled(
    LoginPasswordVisibilityToggled event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(
        obscurePassword: !state.obscurePassword,
      ),
    );
  }

  void _onTermsPressed(
    LoginTermsPressed event,
    Emitter<LoginState> emit,
  ) {
    _launcher.launch(hackerNewsTermsLink);
  }

  void _onPrivacyPolicyPressed(
    LoginPrivacyPolicyPressed event,
    Emitter<LoginState> emit,
  ) {
    _launcher.launch(hackerNewsPrivacyPolicyLink);
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (!state.isValid) return;

    emit(
      state.copyWith(
        status: LoginStatus.loading,
      ),
    );

    try {
      await _repository.login(
        username: state.username,
        password: state.password,
      );

      emit(
        state.copyWith(
          status: LoginStatus.success,
        ),
      );
    } catch (e, s) {
      addError(e, s);
      emit(
        state.copyWith(
          status: LoginStatus.failure,
        ),
      );
    }
  }
}
