import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/version/version.dart';

class CurrentVersion extends StatelessWidget {
  const CurrentVersion({super.key});

  @override
  Widget build(BuildContext context) {
    final version = context.select(
      (VersionBloc bloc) => bloc.state.model.version,
    );

    if (version == null) return const SizedBox.shrink();

    return Text(version);
  }
}
