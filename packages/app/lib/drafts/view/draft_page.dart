import 'package:app/drafts/drafts.dart';
import 'package:draft_repository/draft_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DraftPage extends StatelessWidget {
  const DraftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DraftBloc(
            draftRepository: context.read<DraftRepository>(),
          )..add(
            const DraftSubscriptionRequested(),
          ),
      child: const DraftView(),
    );
  }
}
