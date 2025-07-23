import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/login/login.dart';

class LoginCreateAccountButton extends StatelessWidget {
  const LoginCreateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return TextButton(
      onPressed: () {
        final state = context.read<LoginBloc>().state;
        AppRouter.of(context).push(
          CreateAccountRoute(from: state.from),
        );
      },
      child: Text(l10n.login_createAccountAction),
    );
  }
}
