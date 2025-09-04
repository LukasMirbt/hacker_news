import 'package:app/app_web_view/app_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWebViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppWebViewAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(48);

  @override
  Widget build(BuildContext context) {
    final title = context.select(
      (AppWebViewBloc bloc) => bloc.state.title,
    );

    final textTheme = TextTheme.of(context);

    return AppBar(
      leading: const AppWebViewCloseButton(),
      toolbarHeight: preferredSize.height,
      centerTitle: true,
      title: Text(
        title,
        style: textTheme.titleMedium,
      ),
    );
  }
}
