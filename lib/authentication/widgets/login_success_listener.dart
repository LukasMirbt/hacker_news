import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_router/models/app_router.dart';
import 'package:hacker_client/authentication/authentication.dart';
import 'package:hacker_client/login_loading/login_loading.dart';

class LoginSuccessListener
    extends BlocListener<AuthenticationBloc, AuthenticationState> {
  LoginSuccessListener({super.key})
    : super(
        listenWhen: (previous, current) =>
            previous.status.isUnauthenticated && current.status.isAuthenticated,
        listener: (context, state) {
          final router = AppRouter.of(context);
          router.go(
            LoginLoadingRoute(from: router.from),
          );
        },
      );
}
