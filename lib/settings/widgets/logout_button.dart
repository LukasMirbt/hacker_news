import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/authentication/authentication.dart';
import 'package:hacker_client/l10n/l10n.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (AuthenticationBloc bloc) => bloc.state.logoutStatus.isLoading,
    );

    final l10n = AppLocalizations.of(context);

    return AppOutlinedButton.expand(
      isLoading: isLoading,
      onPressed: () {
        context.read<AuthenticationBloc>().add(
          const AuthenticationLogoutPressed(),
        );
      },
      child: Text(l10n.settings_logout),
    );
  }
}
