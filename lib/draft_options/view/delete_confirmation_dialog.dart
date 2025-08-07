import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/draft_options/draft_options.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  const DeleteConfirmationDialog({super.key});

  static void show({
    required BuildContext context,
    required DraftOptionsBloc bloc,
  }) {
    showDialog<void>(
      context: context,
      builder: (_) => BlocProvider.value(
        value: bloc,
        child: const DeleteConfirmationDialog(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);

    return AlertDialog(
      title: const Text('Delete draft?'),
      content: const Text('The draft will be permanently deleted'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            context.read<DraftOptionsBloc>().add(
              const DraftOptionsDeleteConfirmed(),
            );
            Navigator.of(context).pop();
          },
          child: Text(
            'Delete',
            style: TextStyle(
              color: colorScheme.error,
            ),
          ),
        ),
      ],
    );
  }
}
