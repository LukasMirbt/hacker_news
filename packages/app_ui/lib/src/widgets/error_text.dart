import 'package:app_ui/src/l10n/l10n.dart';
import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppUiLocalizations.of(context);

    return Center(
      child: Text(l10n.error),
    );
  }
}
