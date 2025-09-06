import 'package:app/app_router/app_router.dart';
import 'package:app/authentication/authentication.dart';
import 'package:app/profile/profile.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final bloc = context.read<AuthenticationBloc>();
        final id = bloc.state.user.id;
        context.read<AppRouter>().push(
          ProfileRoute(id: id),
        );
      },
      icon: const AppUserAvatar(),
    );
  }
}
