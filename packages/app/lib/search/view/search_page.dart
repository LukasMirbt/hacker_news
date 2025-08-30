import 'package:app/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_launcher/link_launcher.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({
    super.key,
    this.navigationModel = const SearchNavigationModel(),
  });

  final SearchNavigationModel navigationModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => SearchBloc(
        linkLauncher: context.read<LinkLauncher>(),
      ),
      child: const SearchWebViewBlocProvider(
        child: SearchView(),
      ),
    );
  }
}
