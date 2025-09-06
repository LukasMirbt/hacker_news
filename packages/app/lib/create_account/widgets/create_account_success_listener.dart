import 'package:app/app_router/app_router.dart';
import 'package:app/create_account/create_account.dart';
import 'package:app/login_loading/login_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        AppRouter.of(context).go(
          LoginLoadingRoute(from: state.from),
        );
      },
      child: child,
    );
  }
}
