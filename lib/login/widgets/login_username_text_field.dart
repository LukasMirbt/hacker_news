import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/login/login.dart';

class LoginUsernameTextField extends StatefulWidget {
  const LoginUsernameTextField({super.key});

  @override
  State<LoginUsernameTextField> createState() => _LoginUsernameTextFieldState();
}

class _LoginUsernameTextFieldState extends State<LoginUsernameTextField>
    with RestorationMixin {
  late final RestorableTextEditingController _controller;

  @override
  String get restorationId => 'loginUsernameTextField';

  @override
  void initState() {
    super.initState();
    _controller = RestorableTextEditingController();
  }

  @override
  void restoreState(
    RestorationBucket? oldBucket,
    bool initialRestore,
  ) {
    registerForRestoration(_controller, 'controller');

    final text = _controller.value.text;
    if (text.isNotEmpty) {
      context.read<LoginBloc>().add(
        LoginUsernameRestored(text),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final errorText = context.select(
      (LoginBloc bloc) => bloc.state.form.usernameErrorText(l10n),
    );

    return TextField(
      controller: _controller.value,
      autocorrect: false,
      enableSuggestions: false,
      textInputAction: TextInputAction.next,
      autofillHints: const [AutofillHints.username],
      decoration: InputDecoration(
        labelText: l10n.login_usernameLabel,
        errorText: errorText,
        suffixIcon: errorText != null
            ? const AppIcon.filled(Symbols.error_rounded)
            : null,
      ),
      onChanged: (value) {
        context.read<LoginBloc>().add(
          LoginUsernameChanged(value),
        );
      },
    );
  }
}
