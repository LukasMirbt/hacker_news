import 'package:app/app_router/app_router.dart';
import 'package:app/authentication/authentication.dart';
import 'package:app/logout_loading/logout_loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutListener
    extends BlocListener<AuthenticationBloc, AuthenticationState> {
  LogoutListener({super.key})
    : super(
        listenWhen: (previous, current) =>
            previous.status.isAuthenticated && current.status.isUnauthenticated,
        listener: (context, state) {
          AppRouter.of(context).go(
            const LogoutLoadingRoute(),
          );
        },
      );
}
