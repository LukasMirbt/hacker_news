import 'package:app/app_web_view/app_web_view.dart';
import 'package:app/search/search.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SearchPreventedNavigationListener(
      child: SafeArea(
        child: AppWebViewPopScope(
          child: _Body(),
        ),
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

    return const SearchBody();
  }
}
