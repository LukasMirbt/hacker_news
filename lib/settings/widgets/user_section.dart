import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/authentication/authentication.dart';
import 'package:hacker_client/settings/settings.dart';

class UserSection extends StatelessWidget {
  const UserSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isAuthenticated = context.select(
      (AuthenticationBloc bloc) => bloc.state.status.isAuthenticated,
    );

    if (!isAuthenticated) return const SizedBox.shrink();

    return const UserSectionBody();
  }
}
