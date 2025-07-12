import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/login/login.dart';

class LoginPolicyLinks extends StatelessWidget {
  const LoginPolicyLinks({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);
    final l10n = AppLocalizations.of(context);

    final normalStyle = textTheme.bodyMedium;

    final underlinedStyle = normalStyle?.copyWith(
      decoration: TextDecoration.underline,
      color: colorScheme.tertiary,
      decorationColor: colorScheme.tertiary,
    );

    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(
            text: l10n.login_policyLinksPart1,
            style: normalStyle,
          ),
          TextSpan(
            text: l10n.login_termsOfUse,
            style: underlinedStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.read<LoginBloc>().add(
                  const LoginTermsPressed(),
                );
              },
          ),
          TextSpan(
            text: l10n.login_policyLinksPart3,
            style: normalStyle,
          ),
          TextSpan(
            text: l10n.login_privacyPolicy,
            style: underlinedStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.read<LoginBloc>().add(
                  const LoginPrivacyPolicyPressed(),
                );
              },
          ),
        ],
      ),
    );
  }
}
