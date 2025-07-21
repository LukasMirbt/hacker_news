import 'package:flutter/material.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/post/post.dart';
import 'package:material_symbols_icons/symbols.dart';

class ContextOptionBody extends StatelessWidget {
  const ContextOptionBody({
    required this.postId,
    super.key,
  });

  final String postId;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ListTile(
      leading: const Icon(Symbols.arrow_forward),
      title: const Text('Context'),
      onTap: () {
        PostRoute(postId: postId).pushReplacement(context);
      },
    );
  }
}
