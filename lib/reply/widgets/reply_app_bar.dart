import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/reply/reply.dart';
import 'package:material_symbols_icons/symbols.dart';

class ReplyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ReplyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isSubmittingEnabled = context.select(
      (ReplyBloc bloc) => bloc.state.isSubmittingEnabled,
    );

    final l10n = AppLocalizations.of(context);

    final isDraft = context.select(
      (ReplyBloc bloc) => bloc.state.form.isDraft,
    );

    return AppBar(
      title: !isDraft
          ? null
          : Text.rich(
              TextSpan(
                children: [
                  /*             TextSpan(text: l10n.reply_title),
            const TextSpan(text: ' '), */
                  TextSpan(
                    text: '[draft]',
                    style: TextTheme.of(context).titleLarge?.copyWith(
                      color: ColorScheme.of(context).tertiary,
                    ),
                  ),
                ],
              ),
            ),
      actions: [
        /*   if (isSubmittingEnabled) const ReplySubmitButton(), */
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Symbols.send,
            size: 24,
            opticalSize: 24,
          ),
        ),
        IconButton(
          onPressed: () {
            showModalBottomSheet<void>(
              showDragHandle: true,
              context: context,
              builder: (context) {
                return AppBottomSheet(
                  children: [
                    ListTile(
                      leading: const Icon(Symbols.delete),
                      title: const Text('Clear'),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          icon: const Icon(
            Symbols.more_horiz,
            size: 24,
            opticalSize: 24,
          ),
        ),
      ],
    );
  }
}
