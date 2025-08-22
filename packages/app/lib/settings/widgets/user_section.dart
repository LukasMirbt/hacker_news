import 'package:app/authentication/authentication.dart';
import 'package:app/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
