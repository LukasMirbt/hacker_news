import 'package:app/l10n/l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/widgets.dart';

class PostSearchEmptyBody extends StatelessWidget {
  const PostSearchEmptyBody({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AppEmptyBody(
      icon: Symbols.search_rounded,
      title: l10n.postSearch_emptyTitle,
      body: l10n.postSearch_emptyBody,
    );
  }
}
