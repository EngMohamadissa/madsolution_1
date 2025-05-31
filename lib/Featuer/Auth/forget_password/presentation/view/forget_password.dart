import 'package:flutter/material.dart';
import 'package:freely/Featuer/Auth/forget_password/presentation/view/widget/forget_password_body.dart';
import 'package:freely/core/widget/appare_widget.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppareWidget(
          title: 'Forget Password',
          automaticallyImplyLeading: true,
        ),
      ),
      body: ForgetPasswordBody(),
    );
  }
}
