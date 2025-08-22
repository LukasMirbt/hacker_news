import 'package:app/create_account/create_account.dart';
import 'package:app/l10n/l10n.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountPolicyLinks extends StatelessWidget {
  const CreateAccountPolicyLinks({super.key});

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
            text: l10n.createAccount_policyLinksPart1,
            style: normalStyle,
          ),
          TextSpan(
            text: l10n.createAccount_termsOfUse,
            style: underlinedStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.read<CreateAccountBloc>().add(
                  const CreateAccountTermsPressed(),
                );
              },
          ),
          TextSpan(
            text: l10n.createAccount_policyLinksPart3,
            style: normalStyle,
          ),
          TextSpan(
            text: l10n.createAccount_privacyPolicy,
            style: underlinedStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.read<CreateAccountBloc>().add(
                  const CreateAccountPrivacyPolicyPressed(),
                );
              },
          ),
        ],
      ),
    );
  }
}
