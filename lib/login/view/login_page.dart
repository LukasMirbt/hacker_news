import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/login/login.dart';
import 'package:link_launcher/link_launcher.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    required this.from,
    super.key,
  });

  final String from;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        from: from,
        authenticationRepository: context.read<AuthenticationRepository>(),
        linkLauncher: context.read<LinkLauncher>(),
      ),
      child: const LoginView(),
    );
  }
}
