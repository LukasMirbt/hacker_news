import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/network_error/network_error.dart';

class NetworkErrorPage extends StatelessWidget {
  const NetworkErrorPage({
    required this.from,
    super.key,
  });

  final String from;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NetworkErrorBloc(
        from: from,
        authenticationRepository: context.read<AuthenticationRepository>(),
      ),
      child: const NetworkErrorView(),
    );
  }
}
