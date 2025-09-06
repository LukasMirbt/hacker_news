import 'package:app/l10n/l10n.dart';
import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text(l10n.cancel),
    );
  }
}
