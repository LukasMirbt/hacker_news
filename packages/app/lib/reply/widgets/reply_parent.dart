import 'package:app/reply/reply.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReplyParent extends StatelessWidget {
  const ReplyParent({super.key});

  @override
  Widget build(BuildContext context) {
    final parent = context.select(
      (ReplyBloc bloc) => bloc.state.parent,
    );

    return switch (parent) {
      final CurrentUserReplyParentModel parent => CurrentUserReplyParent(
        parent,
      ),
      final OtherUserReplyParentModel parent => OtherUserReplyParent(
        parent,
      ),
    };
  }
}
