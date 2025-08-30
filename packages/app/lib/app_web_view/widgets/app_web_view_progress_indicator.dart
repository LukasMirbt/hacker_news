import 'package:app/app_web_view/app_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWebViewProgressIndicator extends StatelessWidget {
  const AppWebViewProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final opacity = context.select(
      (AppWebViewBloc bloc) => bloc.state.progress.opacity,
    );

    final value = context.select(
      (AppWebViewBloc bloc) => bloc.state.progress.value,
    );

    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 150),
      child: LinearProgressIndicator(value: value),
    );
  }
}
