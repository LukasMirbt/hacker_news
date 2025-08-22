import 'package:app/reply_options/reply_options.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reply_repository/reply_repository.dart';

class ReplyOptionsSheet extends StatelessWidget {
  const ReplyOptionsSheet({super.key});

  static Future<void> show({
    required BuildContext context,
    required ReplyParent parent,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (_) => BlocProvider(
        lazy: false,
        create: (_) => ReplyOptionsBloc(parent: parent),
        child: const ReplyOptionsSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const AppBottomSheet(
      children: [
        ShareOption(),
        OpenOnWebOption(),
      ],
    );
  }
}
