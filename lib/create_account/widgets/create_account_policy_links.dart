import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/create_account/create_account.dart';
import 'package:hacker_client/l10n/l10n.dart';

class CreateAccountPolicyLinks extends StatelessWidget {
  const CreateAccountPolicyLinks({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final l10n = AppLocalizations.of(context);

    final normalStyle = textTheme.bodyMedium;

    final underlinedStyle = normalStyle?.copyWith(
      decoration: TextDecoration.underline,
    );

    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(
            text: 'By creating an account, you agree to the Hacker News ',
            style: normalStyle,
          ),
          TextSpan(
            text: 'privacy policy',
            style: underlinedStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.read<CreateAccountBloc>().add(
                  const CreateAccountPrivacyPolicyPressed(),
                );
              },
          ),
          TextSpan(
            text: ' and ',
            style: normalStyle,
          ),
          TextSpan(
            text: 'terms of use',
            style: underlinedStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.read<CreateAccountBloc>().add(
                  const CreateAccountPrivacyPolicyPressed(),
                );
              },
          ),
          TextSpan(
            text: '.',
            style: normalStyle,
          ),
        ],
      ),
    );
  }
}
