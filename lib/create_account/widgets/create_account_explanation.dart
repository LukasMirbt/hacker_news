import 'package:flutter/material.dart';
import 'package:hacker_client/l10n/l10n.dart';

class CreateAccountExplanation extends StatelessWidget {
  const CreateAccountExplanation({super.key});

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
            text:
                'Creates a Hacker News account '
                'that can also be used on the Hacker News website.',
            style: normalStyle,
          ),
        ],
      ),
    );
  }
}
