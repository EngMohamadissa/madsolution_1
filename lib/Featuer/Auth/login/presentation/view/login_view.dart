import 'package:flutter/material.dart';

import 'package:freely/Featuer/Auth/login/presentation/view/widget/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: PopScope(canPop: true, child: Scaffold(body: LoginBody())),
    );
  }
}
