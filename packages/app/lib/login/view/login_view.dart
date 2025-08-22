import 'package:app/login/login.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: LoginAppBar(),
      body: LoginBody(),
    );
  }
}
