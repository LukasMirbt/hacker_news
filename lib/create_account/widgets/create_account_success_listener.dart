import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/create_account/create_account.dart';
import 'package:hacker_client/login_loading/login_loading.dart';

class CreateAccountSuccessListener extends StatelessWidget {
  const CreateAccountSuccessListener({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateAccountBloc, CreateAccountState>(
      listenWhen: (previous, current) =>
          !previous.form.status.isSuccess && current.form.status.isSuccess,
      listener: (context, state) {
        LoginLoadingRoute(from: state.from).go(context);
      },
      child: child,
    );
  }
}
