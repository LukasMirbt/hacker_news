import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/reply/reply.dart';

class ReplyOptionBody extends StatelessWidget {
  const ReplyOptionBody({
    required this.url,
    super.key,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final l10n = AppLocalizations.of(context);

    return ListTile(
      leading: Assets.images.replyIcon.image(
        color: colorScheme.onSurfaceVariant,
        width: 24,
        height: 24,
      ),
      title: Text(l10n.commentOptions_reply),
      onTap: () {
        context.read<AppRouter>().pushReplacement(
          ReplyRoute(url: url),
        );
      },
    );
  }
}
