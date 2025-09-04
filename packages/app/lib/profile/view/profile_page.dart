import 'package:app/app_web_view/app_web_view.dart';
import 'package:app/profile/profile.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    required this.id,
    super.key,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final controller = AppWebViewController();
        final cookieManager = CookieManager.instance();
        return AppWebViewBloc(
          configuration: ProfileWebViewConfiguration(id: id),
          appWebViewController: controller,
          appWebViewAuthenticationModel: AppWebViewAuthenticationModel(
            controller: controller,
            cookieManager: AppWebViewCookieManager(
              cookieManager: cookieManager,
              cookieAdapter: AppWebViewCookieAdapter(
                cookieManager: cookieManager,
              ),
            ),
            repository: context.read<AuthenticationRepository>(),
          ),
        )..add(
          const AppWebViewStarted(),
        );
      },
      child: const ProfileView(),
    );
  }
}
