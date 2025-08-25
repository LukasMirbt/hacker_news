import 'package:app/web_redirect/web_redirect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WebRedirectProgressIndicator extends StatelessWidget {
  const WebRedirectProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final opacity = context.select(
      (WebRedirectBloc bloc) => bloc.state.progress.opacity,
    );

    final value = context.select(
      (WebRedirectBloc bloc) => bloc.state.progress.value,
    );

    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 150),
      child: LinearProgressIndicator(value: value),
    );
  }
}
