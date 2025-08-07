import 'package:app_ui/app_ui.dart';
import 'package:draft_repository/draft_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/draft_options/draft_options.dart';

class DraftOptionsSheet extends StatelessWidget {
  const DraftOptionsSheet({super.key});

  static void show({
    required BuildContext context,
    required Draft draft,
  }) {
    showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      showDragHandle: true,
      builder: (_) => BlocProvider(
        create: (context) => DraftOptionsBloc(
          draft: draft,
          draftRepository: context.read<DraftRepository>(),
        ),
        child: const DraftOptionsSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const AppBottomSheet(
      children: [
        ViewPostOption(),
        DeleteOption(),
      ],
    );
  }
}
