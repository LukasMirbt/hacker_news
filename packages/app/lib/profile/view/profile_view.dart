import 'package:app/app_web_view/app_web_view.dart';
import 'package:app/profile/profile.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppWebViewPopScope(
      child: Scaffold(
        appBar: AppWebViewAppBar(),
        body: _Body(),
        bottomNavigationBar: AppWebViewActionBar(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (AppWebViewBloc bloc) => bloc.state.initialLoadStatus.isLoading,
    );

    if (isLoading) return const AppLoadingBody();

    return const ProfileBody();
  }
}
