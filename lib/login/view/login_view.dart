import 'package:flutter/material.dart';
import 'package:hacker_client/login/login.dart';

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
