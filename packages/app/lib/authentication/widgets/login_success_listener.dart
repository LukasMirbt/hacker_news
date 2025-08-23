import 'package:app/app_router/app_router.dart';
import 'package:app/app_router/models/app_router.dart';
import 'package:app/authentication/authentication.dart';
import 'package:app/login_loading/login_loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
