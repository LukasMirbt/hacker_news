import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/network_error/network_error.dart';

class NetworkErrorPage extends StatelessWidget {
  const NetworkErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NetworkErrorBloc(
        authenticationRepository: context.read<AuthenticationRepository>(),
      ),
      child: const NetworkErrorView(),
    );
  }
}
